#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
- class: StepInputExpressionRequirement
- class: InlineJavascriptRequirement
- class: MultipleInputFeatureRequirement

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
  sequences_artifact_filename:
    type: string
    default: emp-paired-end-sequences.qza
  demux_sequences_filename:
    type: string
    default: demux.qza
  demux_visualization_filename:
    type: string
    default: demux.qzv
  output_filename_prefix:
    type: string
    default: ''
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
  qza_directory:
    type: Directory
    outputSource: create_output_directories/qza_directory
  qzv_directory:
    type: Directory
    outputSource: create_output_directories/qzv_directory

steps:
  import_data:
    run: ../subworkflows/qiime2-01-import-data-paired.cwl
    in:
      forward_sequences: forward_sequences
      reverse_sequences: reverse_sequences
      sequences_artifact_filename:
        source:
          - output_filename_prefix
          - sequences_artifact_filename
        valueFrom: ${ return self[0] + self[1]; }
      barcodes: barcodes
    out:
      - sequences_artifact
  demux:
    run: ../subworkflows/qiime2-02-demux-emp-paired.cwl
    in:
      sequences_artifact: import_data/sequences_artifact
      sample_metadata: sample_metadata
      metadata_barcodes_column: metadata_barcodes_column
      demux_sequences_filename:
        source:
          - output_filename_prefix
          - demux_sequences_filename
        valueFrom: ${ return self[0] + self[1]; }
      demux_visualization_filename:
        source:
          - output_filename_prefix
          - demux_visualization_filename
        valueFrom: ${ return self[0] + self[1]; }
    out:
      - demux_sequences_artifact
      - demux_visualization_artifact
  create_output_directories:
    run: ../subworkflows/qiime2-output-directories.cwl
    in:
      qza_files:
        source:
          - import_data/sequences_artifact
          - demux/demux_sequences_artifact
        valueFrom: ${ return [].slice.call(self); }
      qzv_files:
        source: demux/demux_visualization_artifact
        valueFrom: ${ return [self]; }
    out:
      - qza_directory
      - qzv_directory
