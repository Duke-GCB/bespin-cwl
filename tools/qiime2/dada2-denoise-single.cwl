#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: qiime2: Denoises single-end sequences, dereplicates them, and filters chimeras

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  demultiplexed_seqs:
    type: File
    doc: "single-end demultiplexed sequences to be denoised"
    inputBinding:
      prefix: "--i-demultiplexed-seqs"
  trim_left:
    type: int
    doc: "position at which sequences should be trimmed due to low quality (from 5' end)"
    inputBinding:
      prefix: "--p-trim-left"
  trunc_len:
    type: int
    doc: "position at which sequences should be truncated due to decrease in quality (from 3' end)"
    inputBinding:
      prefix: "--p-trunc-len"
  representative_sequences_filename:
    type: string
    doc: "resulting feature sequences filename"
    inputBinding:
      prefix: "--o-representative-sequences"
  table_filename:
    type: string
    doc: "resulting feature table filename"
    inputBinding:
      prefix: "--o-table"
  denoising_stats_filename:
    type: string
    doc: "denoising stats filename"
    inputBinding:
      prefix: "--o-denoising-stats"

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

baseCommand: ["qiime", "dada2", "denoise-single"]

