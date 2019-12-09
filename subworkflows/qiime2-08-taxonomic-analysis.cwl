#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
- class: StepInputExpressionRequirement
label: qiime2 explore sample taxonomic composition
doc: "Taxonomic analysis from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/"

inputs:
  rep_seqs: File
  table: File
  classifier: File
  sample_metadata: File

outputs:
  taxonomy_artifact:
     type: File
     outputSource: classify_features/out_taxa
  taxonomy_visualization_file:
     type: File
     outputSource: tabulate_metadata/visualization_artifact
  taxa_barplot_file:
     type: File
     outputSource: taxa_barplot/taxa_bar_plots

steps:
  classify_features:
    run: ../tools/qiime2/feature-classifier-classify-sklearn.cwl
    in:
      rep_seqs: rep_seqs
      classifier: classifier
      taxonomy_filename:
        valueFrom: 'taxonomy.qza'
    out:
      - out_taxa
  tabulate_metadata:
    run: ../tools/qiime2/metadata-tabulate.cwl
    in:
      input_file: classify_features/out_taxa
      visualization_filename:
        valueFrom: 'taxonomy.qzv'
    out:
      - visualization_artifact
  taxa_barplot:
    run: ../tools/qiime2/taxa-barplot.cwl
    in:
      table: table
      taxonomy: classify_features/out_taxa
      sample_metadata: sample_metadata
      taxa_bar_plots_filename:
        valueFrom: 'taxa-bar-plots.qzv'
    out:
      - taxa_bar_plots
