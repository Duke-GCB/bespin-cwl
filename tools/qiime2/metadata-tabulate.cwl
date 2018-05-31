#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: qiime2: Generate a tabular view of metadata

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  input_file:
    type: File
    doc: "metadata file or artifact viewable as metadata"
    inputBinding:
      prefix: "--m-input-file"
  visualization_filename:
    type: string
    doc: "filename for the resulting visualization file"
    inputBinding:
      prefix: "--o-visualization"
outputs:
  visualization_artifact:
    type: File
    outputBinding:
      glob: $(inputs.visualization_filename)

baseCommand: ["qiime", "metadata", "tabulate"]
