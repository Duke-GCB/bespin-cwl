#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  reads: File[]
  map_reference_genome: File
  threads: int?
outputs:
  qc_reports:
    type: File[]
    outputSource: qc/output_qc_report
  trim_reports:
    type: File[]
    outputSource: trim/trim_reports
  mapped:
    type: File
    outputSource: map/output
  trimmed_reads:
    type: File[]
    outputSource: trim/trimmed_reads
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
        default: "mapped.sam"
      threads: threads
    out:
      - output
