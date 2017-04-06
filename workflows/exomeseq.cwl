#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  reads: File[]
  map_reference_genome: File
  threads: int?
  read_group_library: string
  read_group_sample_name: string
  read_group_platform: string
  read_group_platform_unit: string
outputs:
  qc_reports:
    type: File[]
    outputSource: qc/output_qc_report
  trimmed_reads:
    type: File[]
    outputSource: trim/trimmed_reads
  trim_reports:
    type: File[]
    outputSource: trim/trim_reports
  mapped:
    type: File
    outputSource: map/output
  mapped_sorted:
    type: File
    outputSource: sort/sorted
  duplicate_metrics:
    type: File
    outputSource: mark_duplicates/output_metrics_file
  deduplicated:
    type: File
    outputSource: mark_duplicates/output_dedup_bam_file
  with_read_groups:
    type: File
    outputSource: add_read_groups/output
steps:
  qc:
    run: ../tools/fastqc.cwl
    scatter: input_fastq_file
    in:
      input_fastq_file: reads
      threads: threads
    out:
      - output_qc_report
  trim:
    run: ../tools/trim_galore.cwl
    in:
      reads: reads
      paired:
        default: true
    out:
      - trimmed_reads
      - trim_reports
  map:
    run: ../community-workflows/tools/bwa-mem.cwl
    in:
      reads: trim/trimmed_reads
      reference: map_reference_genome
      output_filename:
        default: "mapped.bam"
      threads: threads
    out:
      - output
  sort:
    run: ../tools/picard-SortSam.cwl
    in:
      input_file: map/output
    out:
      - sorted
  mark_duplicates:
    run: ../tools/picard-MarkDuplicates.cwl
    in:
      input_file: sort/sorted
    out:
      - output_metrics_file
      - output_dedup_bam_file
  add_read_groups:
    run: ../tools/picard-AddReadGroups.cwl
    in:
      read_group_library: read_group_library
      read_group_sample_name: read_group_sample_name
      read_group_platform: read_group_platform
      read_group_platform_unit: read_group_platform_unit
      input_file: mark_duplicates/output_dedup_bam_file
    out:
      - output
