#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement

inputs:
  table:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--i-table"
  rooted_tree:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--i-phylogeny"
  max_depth:
    type: string
  sample_metadata:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--m-metadata-file"

  alpha_rarefaction_filename:
    type: string
    doc: "resulting aligned sequences filename"
    inputBinding:
      prefix: "--o-visualization"

outputs:
  alpha_rarefaction:
    type: File
    outputBinding:
      glob: $(inputs.alpha_rarefaction_filename)

baseCommand: ["qiime", "diversity", "alpha-rarefaction"]

