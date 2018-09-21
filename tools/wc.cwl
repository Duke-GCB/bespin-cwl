cwlVersion: v1.0
class: CommandLineTool
baseCommand: wc
inputs:
  file:
    type: File
    inputBinding:
      position: 1
outputs:
  output:
    type: stdout

