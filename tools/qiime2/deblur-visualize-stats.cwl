#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement

inputs:
  input_file:
    type: File
    doc: "?"
    inputBinding:
      prefix: "--i-deblur-stats"
  deblur_stats_filename:
    type: string
    doc: "?"
    inputBinding:
      prefix: "--o-visualization"
    default: 'deblur-stats.qzv'
outputs:
  deblur_stats:
    type: File
    outputBinding:
      glob: $(inputs.deblur_stats_filename)

baseCommand: ["qiime", "deblur", "visualize-stats"]

