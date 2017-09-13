#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Moves an array of Files into a named directory
requirements:
  - class: InlineJavascriptRequirement

inputs:
  files: File[]
  name: string
outputs:
  outdir: Directory

expression: >
  ${
    var result = {
      outdir: {
        class: 'Directory',
        basename: inputs.name,
        listing: inputs.files
      }
    };

    return result;
  }
