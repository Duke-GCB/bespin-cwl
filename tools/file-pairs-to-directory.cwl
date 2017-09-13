#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Moves an array of File pairs into a named directory
requirements:
  - class: InlineJavascriptRequirement

inputs:
  file_pairs:
    type: { type: array, items: { type: array, items: File } }
  name: string
outputs:
  outdir: Directory

expression: >
  ${
    var files = inputs.file_pairs.reduce(function(a,b) {
        return a.concat(b);
    }, []);

    var result = {
      outdir: {
        class: 'Directory',
        basename: inputs.name,
        listing: files
      }
    };

    return result;
  }
