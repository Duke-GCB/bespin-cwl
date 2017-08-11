#!/usr/bin/env cwl-runner

# This tool works in workflows but not as a standalone cwltool - see https://github.com/common-workflow-language/cwltool/issues/248

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
