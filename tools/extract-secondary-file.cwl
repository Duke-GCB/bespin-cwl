#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
requirements:
  - class: InlineJavascriptRequirement

inputs:
  file:
    type: File
  pattern:
    type: string
outputs:
  extracted:
    type: File

expression: >
  ${
    var secondaryFiles = inputs.file.secondaryFiles;
    var pattern = inputs.pattern;
    var matches = secondaryFiles.filter(function(each) {
      return each.basename.match(pattern);
    });
    return { "extracted" : matches[0] };
  }
