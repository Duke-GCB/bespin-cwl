#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  # For testing, intervals on reference genome
  intervals: string[]?
  # Read samples, fastq format
  recalibrated_reads: File[]
  # reference genome, fasta
  reference_genome: File
  # Number of threads to use
  threads: int?
  # GATK
  GATKJar: File
  # Variant calling
  # Confidence threshold for emitting a possible variant - 10
  stand_emit_conf: double
  # Confidence threshold for calling a variant - 30
  stand_call_conf: double
outputs:
  per_sample_calls:
    type: File[]
    outputSource: discover_variants_01_haplotype_caller/output_HaplotypeCaller
    doc: "VCF files from per sample variant calling"
steps:
  discover_variants_01_haplotype_caller:
    run: ../community-workflows/tools/GATK-HaplotypeCaller.cwl
    scatter: inputBam_HaplotypeCaller
    in:
      GATKJar: GATKJar
      inputBam_HaplotypeCaller: recalibrated_reads
      intervals: intervals
      reference: reference_genome
      genotyping_mode:
        default: "DISCOVERY"
      stand_emit_conf: stand_emit_conf
      stand_call_conf: stand_call_conf
      outputfile_HaplotypeCaller:
        default: "raw_variants.vcf"
    out:
      - output_HaplotypeCaller


