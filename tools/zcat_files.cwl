cwlVersion: v1.0
class: CommandLineTool
baseCommand: zcat
inputs:
    files:
      type: File[]
      streamable: true
      inputBinding:
        position: 1
outputs:
    output:
      type: stdout
      streamable: true
