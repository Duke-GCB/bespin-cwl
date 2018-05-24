#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2
inputs:
  feature_table_artifact: File
  rep_seqs_artifact: File
  sample_metadata: File

  feature_table_summary_filename:
    type: string
    default: table.qzv
  feature_table_tabulation_filename:
    type: string
    default: rep-seqs.qzv

outputs:
  feature_table_summarize_visualization:
    type: File
    outputSource: feature_table_summarize/visualization
  feature_table_tabulation_visualization:
    type: File
    outputSource: feature_table_tabulation/visualization

steps:
  feature_table_summarize:
    run: ../tools/qiime-feature-table-summarize.cwl
    in:
      table: feature_table_artifact
      visualization_filename: feature_table_summary_filename
      sample_metadata_file: sample_metadata
    out:
      - visualization
  feature_table_tabulation:
    run: ../tools/qiime-feature-table-tabulate-seqs.cwl
    in:
      data: dada2_denoise_single/representative_sequences
      visualization_filename: feature_table_tabulation_filename
    out:
      - visualization
