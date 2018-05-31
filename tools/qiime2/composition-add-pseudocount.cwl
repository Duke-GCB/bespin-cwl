#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/diff_abundance.cwl

cwlVersion: v1.0
class: CommandLineTool
label: qiime2: Increment all counts in table by pseudocount

hints:
  - $import: qiime2-docker-hint.yml

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
