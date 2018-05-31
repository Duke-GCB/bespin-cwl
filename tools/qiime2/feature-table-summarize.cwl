#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Generate visual and tabular summaries of a feature table"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  table:
    type: File
    label: "feature table to be summarized"
    inputBinding:
      prefix: "--i-table"
  visualization_filename:
    type: string
    label: "filename for the resulting visualization file"
    inputBinding:
      prefix: "--o-visualization"
  sample_metadata_file:
    type: File
    label: "metadata file or artifact viewable as metadata"
    inputBinding:
      prefix: "--m-sample-metadata-file"
outputs:
  visualization:
    type: File
    outputBinding:
      glob: $(inputs.visualization_filename)

baseCommand: ["qiime", "feature-table", "summarize"]
