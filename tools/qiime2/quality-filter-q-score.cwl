#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/diff_abundance_w_collapse.cwl

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement
inputs:
  demux:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--i-demux"
  filtered_sequences_filename:
    type: string
    doc: "?"
    inputBinding:
      prefix: "--o-filtered-sequences"
    default: "demux-filtered.qza"
  filter_stats_filename:
    type: string
    doc: "?"
    inputBinding:
      prefix: "--o-filter-stats"
    default: "demux-filter-stats.qza"
outputs:
  filtered_sequences:
    type: File
    outputBinding:
      glob: $(inputs.filtered_sequences_filename)
  filter_stats:
    type: File
    outputBinding:
      glob: $(inputs.filter_stats_filename)

baseCommand: ["qiime", "quality-filter", "q-score"]

