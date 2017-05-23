#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
requirements:
  - class: InlineJavascriptRequirement

inputs:
  array1:
    type: File[]
  array2:
    type: File[]
outputs:
  output:
    type: File[]

expression: >
  ${
    var output = inputs.array1.concat(inputs.array2);
    return { "output": output };
  }
