#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement
inputs:
  sequences:
    type: File
    doc: "sequences to be aligned"
    inputBinding:
      prefix: "--i-sequences"
  alignment_filename:
    type: string
    doc: "resulting aligned sequences filename"
    inputBinding:
      prefix: "--o-alignment"
outputs:
  alignment:
    type: File
    outputBinding:
      glob: $(inputs.alignment_filename)

baseCommand: ["qiime", "alignment", "mafft"]
