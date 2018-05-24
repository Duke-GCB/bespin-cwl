#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2

inputs:
  demux_sequences_artifact: File
  trim_length: int
  sample_metadata: File
  demux_filter_visualization_filename:
    type: string
    default: demux-filter-stats.qzv

outputs:
  demux_filtered:
    type: File
    outputSource: deblur_quality_filter/filtered_sequences
  rep_seqs_deblur:
    type: File
    outputSource: deblur_quality_filter/filtered_stats
  rep_seqs_deblur:
    type: File
    outputSource: deblur_denoise/representative_sequences
  table_deblur:
    type: File
    outputSource: deblur_denoise/table
  deblur_stats:
    type: File
    outputSource: deblur_denoise/stats
  demux_filter_stats:
    type: File
    outputSource: deblur_metadata_tabulate/visualization_artifact
  deblur_stats:
    type: File
    outputSource: deblur_visualize/deblur_stats

steps:
  deblur_quality_filter:
    run: ../tools/qiime-quality-filter-g-score.cwl
    in:
      - demux: demux_sequences_artifact
    out:
      - filtered_sequences
      - filtered_stats
  deblur_denoise:
    run: ../tools/qiime-deblur-denoise-16S.cwl
    in:
      - demultiplexed_seqs: demux_sequences_artifact
      - trim_length: trim_length
    out:
      - representative_sequences
      - table
      - stats
  deblur_metadata_tabulate:
    run: ../tools/qiime-metadata-tabluate.cwl
    in:
      - input_file: deblur_quality_filter/filtered_stats
      - visualization_filename: demux_filter_visualization_filename
    out:
      - visualization_artifact
  deblur_visualize:
    run: ../tools/qiime-deblur-visualize-stats.cwl
    in:
      - input_file: deblur_denoise/stats
    out:
      - deblur_stats
