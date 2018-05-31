#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2 Deblur detect/correct sequence data
doc: Option 2: Deblur from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/

inputs:
  demux_sequences_artifact: File
  trim_length: int
  demux_filter_visualization_filename:
    type: string
    default: demux-filter-stats.qzv

outputs:
  filtered_sequences:
    type: File
    outputSource: deblur_quality_filter/filtered_sequences
  filter_stats:
    type: File
    outputSource: deblur_quality_filter/filter_stats
  rep_seqs:
    type: File
    outputSource: deblur_denoise/representative_sequences
  table:
    type: File
    outputSource: deblur_denoise/table
  stats:
    type: File
    outputSource: deblur_denoise/stats
  demux_filter_stats:
    type: File
    outputSource: deblur_metadata_tabulate/visualization_artifact
  stats_visualization:
    type: File
    outputSource: deblur_visualize/deblur_stats

steps:
  deblur_quality_filter:
    run: ../tools/qiime2/quality-filter-q-score.cwl
    in:
      demux: demux_sequences_artifact
    out:
      - filtered_sequences
      - filter_stats
  deblur_denoise:
    run: ../tools/qiime2/deblur-denoise-16S.cwl
    in:
      demultiplexed_seqs: demux_sequences_artifact
      trim_length: trim_length
    out:
      - representative_sequences
      - table
      - stats
  deblur_metadata_tabulate:
    run: ../tools/qiime2/metadata-tabulate.cwl
    in:
      input_file: deblur_quality_filter/filter_stats
      visualization_filename: demux_filter_visualization_filename
    out:
      - visualization_artifact
  deblur_visualize:
    run: ../tools/qiime2/deblur-visualize-stats.cwl
    in:
      input_file: deblur_denoise/stats
    out:
      - deblur_stats
