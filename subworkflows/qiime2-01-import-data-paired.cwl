#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2 importing data
doc: Obtaining and importing data from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/

inputs:
  forward_sequences: File
  reverse_sequences: File
  barcodes: File
  sequences_artifact_type:
    type: string
    default: EMPPairedEndSequences
  sequences_artifact_filename:
    type: string
    default: emp-paired-end-sequences.qza

outputs:
  sequences_artifact:
    type: File
    outputSource: make_sequences_artifact/sequences_artifact

steps:
  make_import_directory:
    run: ../tools/qiime2/EMPPairedEndSequences-directory.cwl
    in:
      forward_sequences: forward_sequences
      reverse_sequences: reverse_sequences
      barcodes: barcodes
    out:
      - dir
  make_sequences_artifact:
    run: ../tools/qiime2/tools-import.cwl
    in:
      input_path: make_import_directory/dir
      type: sequences_artifact_type
      output_filename: sequences_artifact_filename
    out:
      - sequences_artifact
