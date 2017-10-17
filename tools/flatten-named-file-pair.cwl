#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Extracts
requirements:
  - class: InlineJavascriptRequirement
  - $import: ../types/bespin-types.yml
inputs:
  # Named read pairs in FASTQ format
  read_pair:
      type: ../types/bespin-types.yml#NamedFASTQFilePairType
outputs:
  reads:
    type: File[]

expression: >
  ${
    return {
      reads: [
        inputs.read_pair.file1,
        inputs.read_pair.file2,
      ]
    };
  }
