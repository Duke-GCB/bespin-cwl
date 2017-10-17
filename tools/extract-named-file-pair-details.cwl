#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Given a NamedFASTQFilePairType returns an array of the files contained within
requirements:
  - class: InlineJavascriptRequirement
  - $import: ../types/bespin-types.yml
inputs:
  # Named read pairs in FASTQ format
  read_pair:
      type: ../types/bespin-types.yml#NamedFASTQFilePairType
  library:
    type: string
  platform:
    type: string
outputs:
  reads:
    type: File[]
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
        inputs.read_pair.file1,
        inputs.read_pair.file2,
      ],
      read_pair_name: readPairName,
      read_group_header: readGroupHeader
    };

  }
