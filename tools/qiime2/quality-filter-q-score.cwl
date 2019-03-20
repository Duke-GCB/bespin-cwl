#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/diff_abundance_w_collapse.cwl

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Filter sequences based on quality scores and the presence of ambiguous base calls"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  demux:
    type: File
    label: The demultiplexed sequence data to be quality filtered
    inputBinding:
      prefix: "--i-demux"
  filtered_sequences_filename:
    type: string
    doc: "The resulting quality-filtered sequences filename"
    inputBinding:
      prefix: "--o-filtered-sequences"
    default: "demux-filtered.qza"
  filter_stats_filename:
    type: string
    doc: "Summary statistics of the filtering process filename"
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

