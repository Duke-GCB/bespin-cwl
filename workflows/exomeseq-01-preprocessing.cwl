#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  # NOTE: How long is this expected to take?
  intervals: File[]?
  interval_padding: int?
  # Read samples, fastq format
  # NOTE: Broad recommends the illumina basecalls and converts to unmapped SAM
  #   but do we typically have fastq?
  reads: File[]
  # reference genome, fasta
  # NOTE: GATK can't handle compressed fasta reference genome
  # NOTE: is b37 appropriate to use?
  # NOTE: Indexed with bwa and avoided .64 files
  # NOTE: For mapping, they recommend a merge step, but this may only apply to having raw basecalls
  reference_genome: File
  # Number of threads to use for mapping
  threads: int?
  # Read Group annotations
  # Can be the project name
  library: string
  # e.g. Illumina
  platform: string
  # Must include "sample" at minimum
  field_order: string[]?
  # GATK
  GATKJar: File
  knownSites: File[] # vcf files of known sites, with indexing
outputs:
  qc_reports:
    type: File[]
    outputSource: qc/output_qc_report
  trim_reports:
    type: File[]
    outputSource: trim/trim_reports
  # Recalibration
  recalibration_table:
    type: File
    outputSource: recalibrate_01_analyze/output_baseRecalibrator
  recalibrated_reads:
    type: File
    outputSource: recalibrate_02_apply/output_printReads
steps:
  qc:
    run: ../tools/fastqc.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 4
        ramMin: 2500
    scatter: input_fastq_file
    in:
      input_fastq_file: reads
      threads: threads
    out:
      - output_qc_report
  trim:
    run: ../tools/trim_galore.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 4
        ramMin: 8000
    in:
      reads: reads
      paired:
        default: true
    out:
      - trimmed_reads
      - trim_reports
  parse_read_group_header:
    run: ../tools/parse-read-group-header.cwl
    in:
      reads: reads
      field_order: field_order
      library: library
      platform: platform
    out:
      - read_group_header
  map:
    run: ../tools/bwa-mem.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 8
        ramMin: 16000
        outdirMin: 40000
        tmpdirMin: 40000
    in:
      reads: trim/trimmed_reads
      reference: reference_genome
      read_group_header: parse_read_group_header/read_group_header
      output_filename:
        default: "mapped.sam"
      threads: threads
    out:
      - output
  sort:
    run: ../tools/picard-SortSam.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
        outdirMin: 35000
        tmpdirMin: 35000
    in:
      input_file: map/output
    out:
      - sorted
  mark_duplicates:
    run: ../tools/picard-MarkDuplicates.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
    in:
      input_file: sort/sorted
    out:
      - output_metrics_file
      - output_dedup_bam_file
  # Now recalibrate
  recalibrate_01_analyze:
    run: ../tools/GATK-BaseRecalibrator.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 8
        ramMin: 4096
    in:
      GATKJar: GATKJar
      inputBam_BaseRecalibrator: mark_duplicates/output_dedup_bam_file
      intervals: intervals
      interval_padding: interval_padding
      knownSites: knownSites
      cpu_threads:
        default: 8
      outputfile_BaseRecalibrator:
        default: "recal_data.table"
      reference: reference_genome
    out:
      - output_baseRecalibrator
  recalibrate_02_apply:
    run: ../tools/GATK-PrintReads.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 8
        ramMin: 4096
    in:
      GATKJar: GATKJar
      inputBam_printReads: mark_duplicates/output_dedup_bam_file
      intervals: intervals
      input_baseRecalibrator: recalibrate_01_analyze/output_baseRecalibrator
      cpu_threads:
        default: 8
      outputfile_printReads:
        default: "recal_reads.bam"
      reference: reference_genome
    out:
      - output_printReads
