#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/dukegcb/rseqc'
    # cwl supports a dockerFile here, but it is only read if dockerImageId is specified
    # and the image is not present. Also, the file must have a blank line in between
    # each instruction to build correctly. So this is here for informational purposes
    dockerFile: >
      $import RSeQC/Dockerfile

inputs:
  input:
    type: File
    label: 'Alignment file in BAM or SAM format'
    inputBinding:
      prefix: '-i'
    secondaryFiles:
      - ".bai"
  ref_gene_model:
    type: File
    label: 'Reference gene model in bed format'
    inputBinding:
      prefix: '-r'

outputs:
  output:
    type: stdout

baseCommand: [read_distribution.py]
stdout: read_distribution.txt
