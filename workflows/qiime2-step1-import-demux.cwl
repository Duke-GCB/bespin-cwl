#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
doc: |
  QIIME2 Import and Demux Step 1

inputs:
  sequences: File
  barcodes: File
  sample_metadata: File
  metadata_barcodes_column: string

outputs:
  sequences_artifact:
    type: File
    outputSource: import_data/sequences_artifact
  demux_sequences_artifact:
    type: File
    outputSource: demux/demux_sequences_artifact
  demux_visualization_artifact:
    type: File
    outputSource: demux/demux_visualization_artifact

steps:
  import_data:
    run: ../subworkflows/qiime2-01-import-data.cwl
    in:
      sequences: sequences
      barcodes: barcodes
    out:
      - sequences_artifact
  demux:
    run: ../subworkflows/qiime2-02-demux.cwl
    in:
      sequences_artifact: import_data/sequences_artifact
      sample_metadata: sample_metadata
      metadata_barcodes_column: metadata_barcodes_column
    out:
      - demux_sequences_artifact
      - demux_visualization_artifact
