#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: qiime2: Produce an interactive barplot visualization of taxonomies

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  table:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--i-table"
  taxonomy:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--i-taxonomy"
  sample_metadata:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--m-metadata-file"
  taxa_bar_plots_filename:
    type: string
    doc: "?"
    inputBinding:
      prefix: "--o-visualization"

outputs:
  taxa_bar_plots:
    type: File
    outputBinding:
      glob: $(inputs.taxa_bar_plots_filename)

baseCommand: ["qiime", "taxa", "barplot"]
