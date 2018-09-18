#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Given a FASTQReadPairType returns a 2D array of the files contained within
requirements:
  - class: InlineJavascriptRequirement
  - $import: ../types/bespin-types.yml
inputs:
  # Named read pairs in FASTQ format
  read_pair:
      type: ../types/bespin-types.yml#FASTQReadPairType
  library:
    type: string
  platform:
    type: string
outputs:
  reads:
    type:
      type: array
      items:
        type: array
        items: File
  read_pair_name:
    type: string
  read_group_header:
    type: string

expression: >
  ${
    var readPairName = inputs.read_pair.name;
    var readGroupHeader = "@RG" +
      "\\tID:" + readPairName +
      "\\tLB:" + inputs.library +
      "\\tPL:" + inputs.platform +
      "\\tPU:" + readPairName +
      "\\tSM:" + readPairName;
    return {
      reads: [
        inputs.read_pair.read1_files,
        inputs.read_pair.read2_files,
      ],
      read_pair_name: readPairName,
      read_group_header: readGroupHeader
    };

  }
