#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement

hints:
  DockerRequirement:
    dockerPull: qiime2/core:2018.4

inputs:
  alignment:
    type: File
    doc: "alignment to be masked"
    inputBinding:
      prefix: "--i-alignment"
  masked_aligned_rep_seqs_filename:
    type: string
    doc: "masked alignment filename"
    inputBinding:
      prefix: "--o-masked-alignment"
outputs:
  masked_aligned_rep_seqs:
    type: File
    outputBinding:
      glob: $(inputs.masked_aligned_rep_seqs_filename)

baseCommand: ["qiime", "alignment", "mask"]
