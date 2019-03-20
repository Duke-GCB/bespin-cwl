#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Import data to create a new QIIME 2 Artifact"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  type:
    type: string
    label: "semantic type of the artifact that will be created upon importing"
    inputBinding:
      prefix: "--type"
  input_path:
    type: Directory
    label: "path to file or directory that should be imported"
    inputBinding:
      prefix: "--input-path"
  output_filename:
    type: string
    label: "filename to use for output file (qza format)"
    inputBinding:
      prefix: "--output-path"
outputs:
  sequences_artifact:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)

baseCommand: ["qiime", "tools", "import"]

