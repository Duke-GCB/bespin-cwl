#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Display Deblur statistics per sample"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  input_file:
    type: File
    label: "Summary statistics of the Deblur proces"
    inputBinding:
      prefix: "--i-deblur-stats"
  deblur_stats_filename:
    type: string
    label: "The resulting visualization filename"
    inputBinding:
      prefix: "--o-visualization"
    default: 'deblur-stats.qzv'
outputs:
  deblur_stats:
    type: File
    outputBinding:
      glob: $(inputs.deblur_stats_filename)

baseCommand: ["qiime", "deblur", "visualize-stats"]

