#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2
inputs:
  sequences: File
  barcodes: File
  sample_metadata: File
  metadata_barcodes_column: string
  sequences_artifact_type:
    type: string
    default: EMPSingleEndSequences
  sequences_artifact_filename:
    type: string
    default: emp-single-end-sequences.qza
  demux_sequences_filename:
    type: string
    default: demux.qza
  demux_visualization_filename:
    type: string
    default: demux.qzv
outputs:
  import_directory:
    type: Directory
    outputSource: make_import_directory/dir
  sequences_artifact:
    type: File
    outputSource: make_sequences_artifact/sequences_artifact
  demux_sequences_artifact:
    type: File
    outputSource: demux_sequences/demux_sequences_artifact
  demux_visualization_artifact:
    type: File
    outputSource: demux_visualization/demux_visualization_artifact
steps:
  make_import_directory:
    run: ../tools/qiime-EMPSingleEndSequences-directory.cwl
    in:
      sequences: sequences
      barcodes: barcodes
    out:
      - dir
  make_sequences_artifact:
    run: ../tools/qiime-tools-import.cwl
    in:
      input_path: make_import_directory/dir
      type: sequences_artifact_type
      output_filename: sequences_artifact_filename
    out:
      - sequences_artifact
  demux_sequences:
    run: ../tools/qiime-demux-emp-single.cwl
    in:
      seqs: make_sequences_artifact/sequences_artifact
      barcodes_file: sample_metadata
      barcodes_column: metadata_barcodes_column
      per_sample_sequences_filename: demux_sequences_filename
    out:
      - demux_sequences_artifact
  demux_visualization:
    run: ../tools/qiime-demux-summarize.cwl
    in:
      data: demux_sequences/demux_sequences_artifact
      visualization_filename: demux_visualization_filename
    out:
      - demux_visualization_artifact
