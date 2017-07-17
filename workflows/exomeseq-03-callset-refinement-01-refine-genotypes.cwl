#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  intervals: File[]?
  # TODO: Index this file beforehand. Does the previous workflow not index it?
  variants_snps: File
  # TODO: Index this file beforehand. Does the previous workflow not index it?
  variants_indels: File
  # reference genome, fasta
  reference_genome: File
  # Number of threads to use
  threads: int?
  # GATK
  GATKJar: File
  # Genotype Posteriors
  supporting_callsets: File[]
  # TODO: Upgrade pedigrree to []
  # NOTE: Pedigree for trio (parents+child) analyses
#   pedigree: File

outputs:
  posteriors:
    type: File
    outputSource: genotype_posteriors/output_cgp_vcf
    doc: "VCF of derived posteriors of genotype calls"
  filtered:
    type: File
    outputSource: filter_low_quality/output_filtered_vcf
    doc: "VCF of derived posteriors, filtered on quality"
  annotated:
    type: File
    outputSource: annotate_denovo_mutations/output_annotated_vcf
    doc: "VCF, with possible de novo mutations annotated"

steps:
  genotype_posteriors:
    run: ../tools/GATK-CalculateGenotypePosteriors.cwl
    in:
      GATKJar: GATKJar
      intervals: intervals
      variant: variants_snps
      reference: reference_genome
      supporting: supporting_callsets
#       ped: pedigree
      outputfile_cgp_vcf:
        default: "recalibratedVariants.postCGP.vcf"
    out:
      - output_cgp_vcf
  filter_low_quality:
    run: ../tools/GATK-VariantFiltration.cwl
    in:
      GATKJar: GATKJar
      intervals: intervals
      variant: genotype_posteriors/output_cgp_vcf
      reference: reference_genome
      threads:
        default: 1
      genotype_filter_expressions:
        default: ["GQ < 20.0"]
      genotype_filter_names:
        default: ["lowGQ"]
      outputfile_filtered_vcf:
        default: "recalibratedVariants.postCGP.Gfiltered.vcf"
    out:
      - output_filtered_vcf
  annotate_denovo_mutations:
    run: ../tools/GATK-VariantAnnotator.cwl
    in:
      GATKJar: GATKJar
      intervals: intervals
      variant: filter_low_quality/output_filtered_vcf
      reference: reference_genome
      threads:
        default: 1
      annotation:
        default: ["PossibleDeNovo"]
#       ped: pedigree
      outputfile_annotated_vcf:
        default: "recalibratedVariants.postCGP.Gfiltered.deNovos.vcf"
    out:
      - output_annotated_vcf
