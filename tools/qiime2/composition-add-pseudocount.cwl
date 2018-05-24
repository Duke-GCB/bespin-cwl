#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/diff_abundance.cwl

cwlVersion: v1.0
class: CommandLineTool
requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement

inputs:
  table:
    inputBinding:
      prefix: --i-table
    type: File
  composition:
    inputBinding:
      prefix: --o-composition-table
    type: string
    default: 'comp-table.qza'
outputs:
  out_comp_table:
    type: File
    outputBinding:
      glob: $(inputs.composition)

baseCommand: ["qiime", "composition", "add-pseudocount"]
