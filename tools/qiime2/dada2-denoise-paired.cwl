#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Ddenoises paired-end sequences, dereplicates them, and filters chimeras"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  demultiplexed_seqs:
    type: File
    label: "single-end demultiplexed sequences to be denoised"
    inputBinding:
      prefix: "--i-demultiplexed-seqs"
  trunc_len_f:
    type: int
    label: ""
    inputBinding:
      prefix: "--p-trunc-len-f"
  trunc_len_r:
    type: int
    label: ""
    inputBinding:
      prefix: "--p-trunc-len-r"
  trim_left_f:
    type: int
    label: ""
    inputBinding:
      prefix: "--p-trim-left-f"
  trim_left_r:
    type: int
    label: ""
    inputBinding:
      prefix: "--p-trim-left-r"
  representative_sequences_filename:
    type: string
    label: "resulting feature sequences filename"
    inputBinding:
      prefix: "--o-representative-sequences"
  table_filename:
    type: string
    label: "resulting feature table filename"
    inputBinding:
      prefix: "--o-table"
  denoising_stats_filename:
    type: string
    label: "denoising stats filename"
    inputBinding:
      prefix: "--o-denoising-stats"
  n_threads:
    type: int
    label: "number of threads to use for multithreaded processing"
    inputBinding:
      prefix: "--p-n-threads"

outputs:
  representative_sequences:
    type: File
    outputBinding:
      glob: $(inputs.representative_sequences_filename)
  table:
    type: File
    outputBinding:
      glob: $(inputs.table_filename)
  denoising_stats:
    type: File
    outputBinding:
      glob: $(inputs.denoising_stats_filename)

baseCommand: ["qiime", "dada2", "denoise-paired"]

