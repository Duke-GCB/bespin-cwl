#!/usr/bin/env cwl-runner

# This is not working with cwltool - see https://github.com/common-workflow-language/cwltool/issues/248

cwlVersion: v1.0
class: ExpressionTool
requirements:
  - class: InlineJavascriptRequirement

inputs:
  primary:
    type: File
  secondary:
    type: File
outputs:
  merged:
    type: File

expression: >
  ${
    var ret = inputs.primary;
    ret["secondaryFiles"] = [inputs.secondary];
    return {"merged": ret };
  }
