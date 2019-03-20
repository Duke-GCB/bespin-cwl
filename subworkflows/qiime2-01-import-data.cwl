#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2 importing data
doc: Obtaining and importing data from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/

inputs:
  sequences: File
  barcodes: File
  sequences_artifact_type:
    type: string
    default: EMPSingleEndSequences
  sequences_artifact_filename:
    type: string
    default: emp-single-end-sequences.qza

outputs:
  sequences_artifact:
    type: File
    outputSource: make_sequences_artifact/sequences_artifact

steps:
  make_import_directory:
    run: ../tools/qiime2/EMPSingleEndSequences-directory.cwl
    in:
      sequences: sequences
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
