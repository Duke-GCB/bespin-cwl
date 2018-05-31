#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  - $import: qiime2-docker-hint.yml

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
