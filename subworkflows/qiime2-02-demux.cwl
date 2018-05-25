#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2

inputs:
  sequences_artifact: File
  sample_metadata: File
  metadata_barcodes_column: string
  demux_sequences_filename:
    type: string
    default: demux.qza
  demux_visualization_filename:
    type: string
    default: demux.qzv

outputs:
  demux_sequences_artifact:
    type: File
    outputSource: demux_sequences/demux_sequences_artifact
  demux_visualization_artifact:
    type: File
    outputSource: demux_visualization/demux_visualization_artifact

steps:
  demux_sequences:
    run: ../tools/qiime2/demux-emp-single.cwl
    in:
      seqs: sequences_artifact
      barcodes_file: sample_metadata
      barcodes_column: metadata_barcodes_column
      per_sample_sequences_filename: demux_sequences_filename
    out:
      - demux_sequences_artifact
  demux_visualization:
    run: ../tools/qiime2/demux-summarize.cwl
    in:
      data: demux_sequences/demux_sequences_artifact
      visualization_filename: demux_visualization_filename
    out:
      - demux_visualization_artifact
