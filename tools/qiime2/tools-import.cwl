#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement

hints:
  DockerRequirement:
    dockerPull: qiime2/core:2018.4

inputs:
  type:
    type: string
    doc: "semantic type of the artifact that will be created upon importing"
    inputBinding:
      prefix: "--type"
  input_path:
    type: Directory
    doc: "path to file or directory that should be imported"
    inputBinding:
      prefix: "--input-path"
  output_filename:
    type: string
    doc: "filename to use for output file (qza format)"
    inputBinding:
      prefix: "--output-path"
outputs:
  sequences_artifact:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)

baseCommand: ["qiime", "tools", "import"]

