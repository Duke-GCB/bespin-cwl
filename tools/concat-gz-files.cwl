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
      position: 5
      shellQuote: False
arguments:
  - valueFrom: "|"
    position: 2
    shellQuote: False
  - valueFrom: gzip
    position: 3
  - valueFrom: ">"
    position: 4
    shellQuote: False
outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
