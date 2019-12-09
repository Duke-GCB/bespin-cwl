#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: QIIME2 Step 1 paired end sequences
doc: |
  QIIME2 Import and Demux Step 1 paired end sequences

inputs:
  forward_sequences:
    type: File
    doc: paired ended forward sequence reads in FASTQ format
  reverse_sequences:
    type: File
    doc: paired ended reverse sequence reads in FASTQ format
  barcodes: 
    type: File
    doc: barcodes associated with sequences in FASTQ format
  sample_metadata: 
    type: File
    doc: Sample metadata in tsv format
  metadata_barcodes_column: 
    type: string
    doc: name of the column in sample_metadata that contains barcodes

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
    run: ../subworkflows/qiime2-01-import-data-paired.cwl
    in:
      forward_sequences: forward_sequences
      reverse_sequences: reverse_sequences
      barcodes: barcodes
    out:
      - sequences_artifact
  demux:
    run: ../subworkflows/qiime2-02-demux-emp-paired.cwl
    in:
      sequences_artifact: import_data/sequences_artifact
      sample_metadata: sample_metadata
      metadata_barcodes_column: metadata_barcodes_column
    out:
      - demux_sequences_artifact
      - demux_visualization_artifact
