#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
label:  WES GATK4
doc: |
  Whole Exome Sequence analysis GATK4 Preprocessing
requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement
  - class: SchemaDefRequirement
    types:
    - $import: ../types/ExomeseqStudyType.yml
    - $import: ../types/FASTQReadPairType.yml
inputs:
  study_type:
    type: ../types/ExomeseqStudyType.yml#ExomeseqStudyType
  # Intervals should come from capture kit (target intervals) bed format
  target_intervals: File[]?
  # Intervals should come from capture kit (bait intervals) bed format
  bait_intervals: File[]?
  interval_padding: int?
  # Named read pair in FASTQ format
  read_pairs:
      type:
        type: array
        items: ../types/FASTQReadPairType.yml#FASTQReadPairType
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
  # Number of threads to use
  threads: int
  # Read Group annotation
  # Can be the project name
  library: string
  # e.g. Illumina
  platform: string
  known_sites:
    type: File[] # vcf files of known sites, with indexing
    secondaryFiles:
    - .idx
  # Variant Recalibration - SNPs
  snp_resource_hapmap:
    type: File
    secondaryFiles:
    - .idx
  snp_resource_omni:
    type: File
    secondaryFiles:
    - .idx
  snp_resource_1kg:
    type: File
    secondaryFiles:
      - .idx
  # Variant Recalibration - Common
  resource_dbsnp:
    type: File
    secondaryFiles:
    - .idx
  # Variant Recalibration - Indels
  indel_resource_mills:
    type: File
    secondaryFiles:
    - .idx
outputs:
  fastqc_reports_dir:
    type: Directory
    outputSource: organize_directories/fastqc_reports_dir
  trim_reports_dir:
    type: Directory
    outputSource: organize_directories/trim_reports_dir
  raw_variants_dir:
    type: Directory
    outputSource: organize_directories/raw_variants_dir
  bams_markduplicates_dir:
    type: Directory
    outputSource: organize_directories/bams_markduplicates_dir
    doc: "BAM and bai files from markduplicates"
  bams_recalibrated_dir:
    type: Directory
    outputSource: organize_directories/bams_recalibrated_dir
    doc: "BAM files containing recalibrated reads"
  joint_raw_variants:
    type: File
    outputSource: variant_discovery/joint_raw_variants
    doc: "GVCF file from joint genotyping calling"
  filtered_recalibrated_variants:
    type: File
    outputSource: variant_discovery/variant_recalibration_combined_vcf
    doc: "The output filtered and recalibrated VCF file in which each variant is annotated with its VQSLOD value"
  variant_calling_detail_metrics:
    type: File
    outputSource: variant_discovery/detail_metrics
  variant_calling_summary_metrics:
    type: File
    outputSource: variant_discovery/summary_metrics
steps:
  prepare_reference_data:
    run: ../subworkflows/exomeseq-00-prepare-reference-data.cwl
    in:
      target_intervals: target_intervals
      bait_intervals: bait_intervals
      reference_genome: reference_genome
    out:
      - target_interval_list
      - bait_interval_list
  preprocessing:
    run: ../subworkflows/exomeseq-gatk4-01-preprocessing.cwl
    scatter: read_pair
    in:
      intervals: target_intervals
      interval_padding: interval_padding
      target_interval_list: prepare_reference_data/target_interval_list
      bait_interval_list: prepare_reference_data/bait_interval_list
      read_pair: read_pairs
      reference_genome: reference_genome
      threads: threads
      library: library
      platform: platform
      known_sites: known_sites
      resource_dbsnp: resource_dbsnp
    out:
      - fastqc_reports
      - trim_reports
      - markduplicates_bam
      - recalibration_table
      - recalibrated_reads
      - raw_variants
      - haplotypes_bam
  variant_discovery:
    run: ../subworkflows/exomeseq-gatk4-02-variantdiscovery.cwl
    in:
      study_type: study_type
      name: library
      intervals: target_intervals
      interval_padding: interval_padding
      raw_variants: preprocessing/raw_variants
      reference_genome: reference_genome
      snp_resource_hapmap: snp_resource_hapmap
      snp_resource_omni: snp_resource_omni
      snp_resource_1kg: snp_resource_1kg
      resource_dbsnp: resource_dbsnp
      indel_resource_mills: indel_resource_mills
    out:
      - joint_raw_variants
      - variant_recalibration_snps_tranches
      - variant_recalibration_snps_recalibration
      - variant_recalibration_combined_vcf
      - variant_recalibration_indels_tranches
      - variant_recalibration_snps_indels_recalibration
      - variant_recalibration_indels_vcf
      - detail_metrics
      - summary_metrics
  organize_directories:
    run: ../subworkflows/exomeseq-gatk4-03-organizedirectories.cwl
    in:
      fastqc_reports: preprocessing/fastqc_reports
      trim_reports: preprocessing/trim_reports
      bams_markduplicates: preprocessing/markduplicates_bam
      raw_variants: preprocessing/raw_variants
      bams_recalibrated: preprocessing/recalibrated_reads
    out:
      - fastqc_reports_dir
      - trim_reports_dir
      - bams_markduplicates_dir
      - raw_variants_dir
      - bams_recalibrated_dir
