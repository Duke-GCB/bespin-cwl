#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  data:
    type: File
    doc: "de-multiplexed sequences to be summarized"
    inputBinding:
      prefix: "--i-data"
  visualization_filename:
    type: string
    doc: "filename for the resulting visualization file"
    inputBinding:
      prefix: "--o-visualization"
outputs:
  demux_visualization_artifact:
    type: File
    outputBinding:
      glob: $(inputs.visualization_filename)

baseCommand: ["qiime", "demux", "summarize"]

