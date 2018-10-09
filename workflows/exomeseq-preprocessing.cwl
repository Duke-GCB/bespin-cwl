#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
label:  WES Preprocessing
doc: |
  Whole Exome Sequence analysis Preprocessing
requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement
  - $import: ../types/bespin-types.yml
inputs:
  # Intervals should come from capture kit (target intervals) bed format
  target_intervals: File[]?
  # Intervals should come from capture kit (bait intervals) bed format
  bait_intervals: File[]?
  interval_padding: int?
  # Named read pair in FASTQ format
  read_pair:
      type: ../types/bespin-types.yml#FASTQReadPairType
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
  # GATK
  GATKJar:
    type: File
  knownSites:
    type: File[] # vcf files of known sites, with indexing
    secondaryFiles:
    - .idx
  # Variant Recalibration - Common
  resource_dbsnp:
    type: File
    secondaryFiles:
    - .idx
outputs:
  fastqc_reports:
    type: File[]
    outputSource: preprocessing/fastqc_reports
  trim_reports:
    type: File[]
    outputSource: preprocessing/trim_reports
  raw_variants:
    type: File
    outputSource: preprocessing/raw_variants
  hs_metrics:
    type: File
    outputSource: preprocessing/hs_metrics
  markduplicates_bam:
    type: File
    outputSource: preprocessing/markduplicates_bam
    doc: "BAM and bai files from markduplicates"
  recalibrated_reads:
    type: File
    outputSource: preprocessing/recalibrated_reads
    doc: "BAM files containing recalibrated reads"
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
    run: ../subworkflows/exomeseq-01-preprocessing.cwl
    in:
      intervals: target_intervals
      target_interval_list: prepare_reference_data/target_interval_list
      bait_interval_list: prepare_reference_data/bait_interval_list
      interval_padding: interval_padding
      read_pair: read_pair
      reference_genome: reference_genome
      threads: threads
      library: library
      platform: platform
      GATKJar: GATKJar
      knownSites: knownSites
      resource_dbsnp: resource_dbsnp
    out:
      - fastqc_reports
      - trim_reports
      - markduplicates_bam
      - recalibration_table
      - recalibrated_reads
      - raw_variants
      - hs_metrics
