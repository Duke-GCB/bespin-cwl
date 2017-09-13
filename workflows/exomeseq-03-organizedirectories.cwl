#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  # Need inputs as array
  fastqc_reports:
    type: { type: array, items: { type: array, items: File } }
  trim_reports:
    type: { type: array, items: { type: array, items: File } }
  raw_variants: File[]
  bams_final: File[]
outputs:
  fastqc_reports_dir:
    type: Directory
    outputSource: org_fastqc_reports/outdir
  trim_reports_dir:
    type: Directory
    outputSource: org_trim_reports/outdir
  raw_variants_dir:
    type: Directory
    outputSource: org_raw_variants/outdir
  bams_final_dir:
    type: Directory
    outputSource: org_bams_final/outdir
steps:
  org_fastqc_reports:
    run: ../tools/file-pairs-to-directory.cwl
    in:
      name:
        default: 'fastqc-reports'
      file_pairs: fastqc_reports
    out:
      - outdir
  org_trim_reports:
    run: ../tools/file-pairs-to-directory.cwl
    in:
      name:
        default: 'trim-reports'
      file_pairs: trim_reports
    out:
      - outdir
  org_raw_variants:
    run: ../tools/files-to-directory.cwl
    in:
      name:
        default: 'raw-variants'
      files: raw_variants
    out:
      - outdir
  org_bams_final:
    run: ../tools/files-to-directory.cwl
    in:
      name:
        default: 'bams-final'
      files: bams_final
    out:
      - outdir

