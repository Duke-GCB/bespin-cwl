#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2 create feature visual summaries
doc: "FeatureTable and FeatureData summaries from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/"

inputs:
  feature_table_artifact: File
  rep_seqs_artifact: File
  sample_metadata: File
  filter_feature_table_where: string

  filtered_table_filename_filename:
    type: string
    default: filtered-table.qzv
  feature_table_summary_filename:
    type: string
    default: table.qzv
  feature_table_tabulation_filename:
    type: string
    default: rep-seqs.qzv

outputs:
  filtered_feature_table_artifact:
    type: File
    outputSource: filter_feature_table/filtered_table
  feature_table_summarize_visualization:
    type: File
    outputSource: feature_table_summarize/visualization
  feature_table_tabulation_visualization:
    type: File
    outputSource: feature_table_tabulation/visualization

steps:
  filter_feature_table:
    run: ../tools/qiime2/feature-table-filter-samples.cwl
    in:
      table: feature_table_artifact
      sample_metadata_file: sample_metadata
      filter_where: filter_feature_table_where
      filtered_table_filename: filtered_table_filename_filename
    out:
      - filtered_table
  feature_table_summarize:
    run: ../tools/qiime2/feature-table-summarize.cwl
    in:
      table: filter_feature_table/filtered_table
      visualization_filename: feature_table_summary_filename
      sample_metadata_file: sample_metadata
    out:
      - visualization
  feature_table_tabulation:
    run: ../tools/qiime2/feature-table-tabulate-seqs.cwl
    in:
      data: rep_seqs_artifact
      visualization_filename: feature_table_tabulation_filename
    out:
      - visualization
