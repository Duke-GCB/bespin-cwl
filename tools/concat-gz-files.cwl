cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
baseCommand: zcat
inputs:
  files:
    type: File[]
    inputBinding:
      position: 1
      shellQuote: False
  output_filename:
    type: string
    inputBinding:
      position: 4
      shellQuote: False
arguments:
  - valueFrom: "| gzip"
    position: 2
    shellQuote: False
  - valueFrom: ">"
    position: 3
    shellQuote: False
outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
