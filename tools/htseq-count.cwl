#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/dukegcb/htseq'
    # cwl supports a dockerFile here, but it is only read if dockerImageId is specified
    # and the image is not present. Also, the file must have a blank line in between
    # each instruction to build correctly. So this is here for informational purposes
    dockerFile: |
      $import: HTSeq/Dockerfile

inputs:
  alignment_file:
    # Must have bai index as secondaryFile
    type: File
    label: ""
    inputBinding:
      position: 2
  gff_file:
    type: File
    label: ""
    inputBinding:
      position: 3
  samtype:
    type: string?
    label: ""
    inputBinding:
      position: 1
      prefix: '-f'
  order:
    type: string?
    label: ""
    inputBinding:
      position: 1
      prefix: '-r'
  stranded:
    type: string?
    label: ""
    inputBinding:
      position: 1
      prefix: '-s'
  minaqual:
    type: int?
    label: ""
    inputBinding:
      position: 1
      prefix: '-a'
  featuretype:
    type: string?
    label: "feature type (3rd column in GFF file) to be used, all features of other type are ignored (default, suitable for Ensembl GTF files: exon)"
    inputBinding:
      position: 1
      prefix: '-t'
  idattr:
    type: string?
    label: "GFF attribute to be used as feature ID (default, suitable for Ensembl GTF files: gene_id)"
    inputBinding:
      position: 1
      prefix: '-i'
  mode:
    type: string?
    label: ""
    inputBinding:
      position: 1
      prefix: '-m'
  samout:
    type: string?
    label: ""
    inputBinding:
      position: 1
      prefix: '-o'
outputs:
  output:
    type: stdout

baseCommand: [htseq-count]
stdout: htseq-count.txt

