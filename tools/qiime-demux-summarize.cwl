#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement
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

