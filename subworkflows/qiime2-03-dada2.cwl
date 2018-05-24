#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2

inputs:
  demux_sequences_artifact: File
  dada2_trim_left: int
  dada2_trunc_len: int
  sample_metadata: File
  dada2_representative_sequences_filename:
    type: string
    default: rep-seqs-dada2.qza
  dada2_table_filename:
    type: string
    default: table-dada2.qza
  dada2_denoising_stats_filename:
    type: string
    default: stats-dada2.qza
  dada2_stats_filename:
    type: string
    default: stats-dada2.qzv

outputs:
  dada2_representative_sequences:
    type: File
    outputSource: dada2_denoise_single/representative_sequences
  dada2_table:
    type: File
    outputSource: dada2_denoise_single/table
  dada2_denoising_stats:
    type: File
    outputSource: dada2_denoise_single/denoising_stats
  dada2_visualization_artifact:
    type: File
    outputSource: dada2_visualization/visualization_artifact

steps:
  dada2_denoise_single:
    run: ../tools/qiime-dada2-denoise-single.cwl
    in:
      demultiplexed_seqs: demux_sequences_artifact
      trim_left: dada2_trim_left
      trunc_len: dada2_trunc_len
      representative_sequences_filename: dada2_representative_sequences_filename
      table_filename: dada2_table_filename
      denoising_stats_filename: dada2_denoising_stats_filename
    out:
      - representative_sequences
      - table
      - denoising_stats
  dada2_visualization:
    run: ../tools/qiime-metadata-tabulate.cwl
    in:
      input_file: dada2_denoise_single/denoising_stats
      visualization_filename: dada2_stats_filename
    out:
      - visualization_artifact
