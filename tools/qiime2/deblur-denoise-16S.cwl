#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Perform sequence quality control for Illumina data using the Deblur workflow with a 16S reference as a positive filter"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  demultiplexed_seqs:
    type: File
    label: "The demultiplexed sequences to be denoised"
    inputBinding:
      prefix: "--i-demultiplexed-seqs"
  trim_length:
    type: int
    label: "Sequence trim length, specify -1 to disable trimming"
    inputBinding:
      prefix: "--p-trim-length"
  representative_sequences_filename:
    type: string
    label: "The resulting feature sequences filename"
    inputBinding:
      prefix: "--o-representative-sequences"
    default: 'rep-seqs.qza'
  table_filename:
    type: string
    label: "The resulting denoised feature table filename"
    inputBinding:
      prefix: "--o-table"
    default: 'table.qza'
  stats_filename:
    type: string
    label: "The resulting per-sample stats filename"
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

