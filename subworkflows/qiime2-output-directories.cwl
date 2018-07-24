#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

label: qiime2 output directory creation
doc: "Creates qza and qzv output directories"

inputs:
  qza_files:
    type: File[]
  qza_directory_name:
    type: string
    default: 'qza'
  qzv_files:
    type: File[]
  qzv_directory_name:
    type: string
    default: 'qzv'

outputs:
  qza_directory:
    type: Directory
    outputSource: create_qza_directory/outdir
  qzv_directory:
    type: Directory
    outputSource: create_qzv_directory/outdir

steps:
  create_qza_directory:
    run: ../tools/files-to-directory.cwl
    in:
      name: qza_directory_name
      files: qza_files
    out:
      - outdir
  create_qzv_directory:
    run: ../tools/files-to-directory.cwl
    in:
      name: qzv_directory_name
      files:
        source: qzv_files
    out:
      - outdir

