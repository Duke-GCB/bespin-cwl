#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
- class: StepInputExpressionRequirement
label: qiime2 identify differentially abundant features
doc: "Differential abundance testing with ANCOM from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/"

inputs:
  table: File
  sample_metadata: File
  collapse_level: int
  taxonomy: File
  filter_sample_query: string

outputs:
  filter_table_file:
    type: File
    outputSource: filter_gut_samples/filtered_table
  composition_table_file:
    type: File
    outputSource: pseudocount_gut_table/out_comp_table
  ancom_visualization_file:
    type: File
    outputSource: ancom_subject_column_gut_table/out_visual
  collapsed_table_file:
    type: File
    outputSource: gut_table_collapse/out_collapsed_table
  comp_gut_table_l6_file:
    type: File
    outputSource: comp_gut_table_l6/out_comp_table
  ancom_subject_16_visualization_file:
    type: File
    outputSource: ancom_subject_16/out_visual
steps:
  filter_gut_samples:
    run: ../tools/qiime2/feature-table-filter-samples.cwl
    in:
      table: table
      sample_metadata_file: sample_metadata
      filter_where: filter_sample_query
      filtered_table_filename:
        valueFrom: 'gut-table.qza'
    out:
      - filtered_table
  pseudocount_gut_table:
    run: ../tools/qiime2/composition-add-pseudocount.cwl
    in:
      table: filter_gut_samples/filtered_table
      composition:
        valueFrom: 'comp-gut-table.qza'
    out:
      - out_comp_table
  ancom_subject_column_gut_table:
    run: ../tools/qiime2/composition-ancom.cwl
    in:
      comp_table: pseudocount_gut_table/out_comp_table
      metadata_file: sample_metadata
      metadata_column:
        valueFrom: 'Subject'
      feat_visualization:
        valueFrom: 'ancom.qzv'
    out:
      - out_visual
  gut_table_collapse:
    run: ../tools/qiime2/taxa-collapse.cwl
    in:
      table: filter_gut_samples/filtered_table
      taxonomy_file: taxonomy
      collapse_level: collapse_level
      collapsed_table:
        valueFrom: 'gut-table-l6.qza'
    out:
      - out_collapsed_table
  comp_gut_table_l6:
    run: ../tools/qiime2/composition-add-pseudocount.cwl
    in:
      table: gut_table_collapse/out_collapsed_table
      composition:
        valueFrom: 'comp-gut-table-l6.qza'
    out:
      - out_comp_table
  ancom_subject_16:
    run: ../tools/qiime2/composition-ancom.cwl
    in:
      comp_table: comp_gut_table_l6/out_comp_table
      metadata_file: sample_metadata
      metadata_column:
        valueFrom: 'Subject'
      feat_visualization:
        valueFrom: 'l6-ancom-Subject.qzv'
    out:
      - out_visual
