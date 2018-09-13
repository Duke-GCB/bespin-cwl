cwlVersion: v1.0
class: CommandLineTool
baseCommand: gzip
inputs:
  file:
    type: File
    streamable: true
    inputBinding:
      position: 1
  tostdout:
    type: boolean
    default: true
    inputBinding:
      prefix: "--to-stdout"
      position: 2
outputs:
    output:
      type: stdout
      streamable: true
