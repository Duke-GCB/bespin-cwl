#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Perform de novo multiple sequence alignment using MAFFT"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  sequences:
    type: File
    label: "sequences to be aligned"
    inputBinding:
      prefix: "--i-sequences"
  alignment_filename:
    type: string
    label: "resulting aligned sequences filename"
    inputBinding:
      prefix: "--o-alignment"
outputs:
  alignment:
    type: File
    outputBinding:
      glob: $(inputs.alignment_filename)

baseCommand: ["qiime", "alignment", "mafft"]
