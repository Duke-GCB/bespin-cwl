cwlVersion: v1.0
class: CommandLineTool
baseCommand: cat
inputs:
    reads_array:
      type: File[]
      inputBinding:
        position: 1
outputs:
    reads:
        type: stdout
