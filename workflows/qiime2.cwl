#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2
inputs:
  sequences_directory: Directory
  artifact_type: string
  artifact_filename: string
  barcodes_file: File
  barcodes_column: string
  per_sample_sequences_filename: string
  demux_visualization_filename: string
  dada2_trim_left: int
  dada2_trunc_len: int
  dada2_representative_sequences_filename: string
  dada2_table_filename: string
  dada2_denoising_stats_filename: string
  dada2_stats_filename: string
outputs:
  sequences_artifact:
    type: File
    outputSource: import_sequences/sequences_artifact
  demux_sequences_artifact:
    type: File
    outputSource: demux_sequences/demux_sequences_artifact
  demux_visualization_artifact:
    type: File
    outputSource: demux_visualization/demux_visualization_artifact
  dada2_representative_sequences:
    type: File
    outputSource: dada2_denoise_single/representative_sequences
  dada2_table:
    type: File
    outputSource: dada2_denoise_single/table
  dada2_representative_sequences:
    type: File
    outputSource: dada2_denoise_single/representative_sequences
  dada2_visualization_artifact:
    type: File
    outputSource: dada2_visualization/visualization_artifact
steps:
  import_sequences:
    run: ../tools/qiime-tools-import.cwl
    in:
      input_path: sequences_directory
      type: artifact_type
      output_filename: artifact_filename
    out:
      - sequences_artifact
  demux_sequences:
    run: ../tools/qiime-demux-emp-single.cwl
    in:
      seqs: import_sequences/sequences_artifact
      barcodes_file: barcodes_file
      barcodes_column: barcodes_column
      per_sample_sequences_filename: per_sample_sequences_filename
    out:
      - demux_sequences_artifact
  demux_visualization:
    run: ../tools/qiime-demux-summarize.cwl
    in:
      data: demux_sequences/demux_sequences_artifact
      visualization_filename: demux_visualization_filename
    out:
      - demux_visualization_artifact
  dada2_denoise_single:
    run: ../tools/qiime-dada2-denoise-single.cwl
    in:
      demultiplexed_seqs: demux_sequences/demux_sequences_artifact
      trim_left: dada2_trim_left
      trunc_len: dada2_trim_left
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

