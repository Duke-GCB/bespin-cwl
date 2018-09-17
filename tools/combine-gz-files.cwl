cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ShellCommandRequirement
baseCommand: zcat
inputs:
  files_input:
    type: File[]
    inputBinding:
      position: 1
      shellQuote: False
  pipe:
    type: string
    default: "|"
    inputBinding:
      position: 2
      shellQuote: False
  to_gzip:
    type: string
    default: "gzip"
    inputBinding:
      position: 3
      shellQuote: False
  redirect:
    type: string
    default: ">"
    inputBinding:
      position: 4
      shellQuote: False
  output_filename:
    type: string
    default: "output.gz"
    inputBinding:
      position: 5
      shellQuote: False
outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
