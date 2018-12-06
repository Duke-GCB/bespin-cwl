#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
requirements:
  - class: InlineJavascriptRequirement

inputs:
  files:
    type: File[]?
  index:
    type: int
outputs:
  extracted:
    type: File

expression: >
  ${
    if(inputs.files) {
      return { "extracted" : inputs.files[inputs.index] };
    } else {
      return { "extracted" : null };
    }
  }
