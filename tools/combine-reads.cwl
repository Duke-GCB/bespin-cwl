cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
baseCommand: zcat
inputs:
  reads:
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
arguments:
  - position: 5
    valueFrom: $(inputs.reads[0].nameroot + "-combined.fastq.gz")
outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.reads[0].nameroot + "-combined.fastq.gz")
