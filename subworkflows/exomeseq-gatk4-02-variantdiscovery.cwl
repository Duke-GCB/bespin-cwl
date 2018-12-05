#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - $import: ../types/bespin-types.yml
inputs:
  study_type:
    type: ../types/bespin-types.yml#ExomeseqStudyType
  name: string
  intervals: File[]?
  interval_padding: int?
  raw_variants: File[]
  # reference genome, fasta
  reference_genome:
    type: File
    secondaryFiles:
    - .amb
    - .ann
    - .bwt
    - .pac
    - .sa
    - .fai
    - ^.dict
  # Variant Recalibration - SNPs
  snp_resource_hapmap: File
  snp_resource_omni: File
  snp_resource_1kg: File
  # Variant Recalibration - Common
  resource_dbsnp: File
  # Variant Recalibration - Indels
  indel_resource_mills: File
  indel_resource_axiom_poly: File
outputs:
  joint_raw_variants:
    type: File
    outputSource: joint_genotyping/output_vcf
    doc: "VCF file from joint genotyping calling"
  variant_recalibration_snps_tranches:
    type: File
    outputSource: variant_recalibration_snps/output_tranches
    doc: "The output tranches file used by ApplyVQSR in SNP mode"
  variant_recalibration_snps_recalibration:
    type: File
    outputSource: variant_recalibration_snps/output_recalibration
    doc: "The output recalibration file used by ApplyVQSR in SNP mode"
  variant_recalibration_combined_vcf:
    type: File
    outputSource: apply_vqsr_snps/output_recalibrated_variants
    doc: "The output VCF file after INDEL and SNP recalibration"
  variant_recalibration_indels_tranches:
    type: File
    outputSource: variant_recalibration_indels/output_tranches
    doc: "The output tranches file used by ApplyVQSR in INDEL mode"
  variant_recalibration_snps_indels_recal:
    type: File
    outputSource: variant_recalibration_indels/output_recalibration
    doc: "The output recalibration file used by ApplyVQSR in INDEL mode"
  variant_recalibration_indels_vcf:
    type: File
    outputSource: apply_vqsr_indels/output_recalibrated_variants
    doc: "The output VCF file after INDEL recalibration"
steps:
  generate_joint_filenames:
    run: ../tools/generate-joint-filenames.cwl
    in:
      name: name
    out:
      - raw_variants_filename
      - snps_recalibration_filename
      - snps_tranches_filename
      - snps_recalibrated_variants_filename
      - indels_recalibration_filename
      - indels_tranches_filename
      - indels_recalibrated_variants_filename
      - combined_recalibrated_variants_filename
  joint_genotyping:
    run: ../tools/GATK4-GenotypeGVCFs.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 2
        ramMin: 7168
    in:
      reference: reference_genome
      output_vcf_filename: generate_joint_filenames/raw_variants_filename
      dbsnp: resource_dbsnp
      annotation_groups: { default: ['StandardAnnotation','AS_StandardAnnotation'] }
      only_output_calls_starting_in_intervals: { default: true }
      use_new_qual_calculator: { default: true }
      variants: raw_variants
      intervals: intervals
      interval_padding: interval_padding
      java_opt: { default: "-Xmx5g -Xms5g" }
    out:
      - output_vcf
  generate_annotations_indels:
    run: ../tools/generate-variant-recalibration-annotation-set.cwl
    in:
      study_type: study_type
      base_annotations:
        default: ["FS", "ReadPosRankSum", "MQRankSum", "QD", "SOR", "DP"]
    out:
      - annotations
  generate_annotations_snps:
    run: ../tools/generate-variant-recalibration-annotation-set.cwl
    in:
      study_type: study_type
      base_annotations:
        default: ["QD", "MQRankSum", "ReadPosRankSum", "FS", "MQ", "SOR", "DP"]
    out:
      - annotations
  variant_recalibration_indels:
    run: ../tools/GATK4-VariantRecalibrator.cwl
    in:
      java_opt: { default: "-Xmx24g -Xms24g" }
      variants: joint_genotyping/output_vcf
      output_recalibration_filename: generate_joint_filenames/indels_recalibration_filename
      output_tranches_filename: generate_joint_filenames/indels_tranches_filename
      tranches: { default: ["100.0", "99.95", "99.9", "99.8", "99.6", "99.5", "99.4", "99.3", "99.0", "98.0", "97.0", "90.0"] }
      annotations: generate_annotations_snps/annotations
      mode: { default: "SNP" }
      resources:
        default:
          - { name: "mills", known: false, training: true, truth: true, prior: 12, file: indel_resource_mills }
          - { name: "axiomPoly", known: false, training: true, truth: false, prior: 10, file: indel_resource_axiom_poly }
          - { name: "dbsnp", known: true, training: false, truth: false, prior: 2, file: resource_dbsnp }
    out:
      - output_recalibration
      - output_tranches
  variant_recalibration_snps:
    run: ../tools/GATK4-VariantRecalibrator.cwl
    in:
      java_opt: { default: "-Xmx3g -Xms3g" }
      variants: joint_genotyping/output_vcf
      output_recalibration_filename: generate_joint_filenames/snps_recalibration_filename
      output_tranches_filename: generate_joint_filenames/snps_tranches_filename
      tranches: { default: ["100.0", "99.95", "99.9", "99.8", "99.6", "99.5", "99.4", "99.3", "99.0", "98.0", "97.0", "90.0"] }
      annotations: generate_annotations_snps/annotations
      mode: { default: "SNP" }
      resources:
        default:
          - { name: "hapmap", known: false, training: true, truth: true, prior: 15, file: snp_resource_hapmap }
          - { name: "omni", known: false, training: true, truth: true, prior: 12, file: snp_resource_omni }
          - { name: "1000G", known: false, training: true, truth: false, prior: 10, file: snp_resource_1kg }
          - { name: "dbsnp", known: true, training: false, truth: false, prior: 7, file: resource_dbsnp }
    out:
      - output_recalibration
      - output_tranches
  apply_vqsr_indels:
    run: ../tools/GATK4-ApplyVQSR.cwl
    in:
      java_opt: { default: "-Xmx5g -Xms5g" }
      output_recalibrated_variants_filename: generate_joint_filenames/indels_recalibrated_variants_filename
      variants: joint_genotyping/output_vcf
      recalibration_file: variant_recalibration_indels/output_recalibration
      tranches_File: variant_recalibration_indels/output_tranches
      truth_sensitivity_filter_level: { default: 99.7 }
      create_output_variant_index: { default: true }
      mode: { default: "INDEL" }
    out:
      - output_recalibrated_variants
  apply_vqsr_snps:
    run: ../tools/GATK4-ApplyVQSR.cwl
    in:
      java_opt: { default: "-Xmx5g -Xms5g" }
      output_recalibrated_variants_filename: generate_joint_filenames/combined_recalibrated_variants_filename
      variants: apply_vqsr_indels/output_recalibrated_variants
      recalibration_file: variant_recalibration_indels/output_recalibration
      tranches_File: variant_recalibration_indels/output_tranches
      truth_sensitivity_filter_level: { default: 99.7 }
      create_output_variant_index: { default: true }
      mode: { default: "SNP" }
    out:
      - output_recalibrated_variants