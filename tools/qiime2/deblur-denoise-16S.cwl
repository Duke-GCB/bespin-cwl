#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement

inputs:
  demultiplexed_seqs:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--i-demultiplexed-seqs"
  trim_length:
    type: int
    doc: "?"
    inputBinding:
      prefix: "--p-trim-length"
  representative_sequences_filename:
    type: string
    doc: "?"
    inputBinding:
      prefix: "--o-representative-sequences"
    default: 'rep-seqs.qza'
  table_filename:
    type: string
    doc: "?"
    inputBinding:
      prefix: "--o-table"
    default: 'table.qza'
  stats_filename:
    type: string
    doc: "?"
    inputBinding:
      prefix: "--o-stats"
    default: 'stats.qza'

outputs:
  representative_sequences:
    type: File
    outputBinding:
      glob: $(inputs.representative_sequences_filename)
  table:
    type: File
    outputBinding:
      glob: $(inputs.table_filename)
  stats:
    type: File
    outputBinding:
      glob: $(inputs.stats_filename)

baseCommand: ["qiime", "deblur", "denoise-16S", "--p-sample-stats"]

