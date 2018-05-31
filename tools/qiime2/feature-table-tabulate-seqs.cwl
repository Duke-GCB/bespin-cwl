#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: qiime2: Generate tabular view of feature identifier to sequence mapping, including links to BLAST each sequence against the NCBI nt database

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  data:
    type: File
    doc: "feature sequences to be tabulated"
    inputBinding:
      prefix: "--i-data"
  visualization_filename:
    type: string
    doc: "filename for the resulting visualization file"
    inputBinding:
      prefix: "--o-visualization"
outputs:
  visualization:
    type: File
    outputBinding:
      glob: $(inputs.visualization_filename)

baseCommand: ["qiime", "feature-table", "tabulate-seqs"]
