#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Produce an interactive barplot visualization of taxonomies"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  table:
    type: File
    label: Feature table to visualize at various taxonomic levels
    inputBinding:
      prefix: "--i-table"
  taxonomy:
    type: File
    label: Taxonomic annotations for features in the provided feature table
    inputBinding:
      prefix: "--i-taxonomy"
  sample_metadata:
    type: File
    label: Metadata file or artifact viewable as metadata
    inputBinding:
      prefix: "--m-metadata-file"
  taxa_bar_plots_filename:
    type: string
    label: "The resulting visualization filename"
    inputBinding:
      prefix: "--o-visualization"

outputs:
  taxa_bar_plots:
    type: File
    outputBinding:
      glob: $(inputs.taxa_bar_plots_filename)

baseCommand: ["qiime", "taxa", "barplot"]
