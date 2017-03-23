#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: dukegcb/picard
- class: InlineJavascriptRequirement

inputs:
  input_file:
    type: File
    doc: "The BAM or SAM file to sort.  Required."
    inputBinding:
      prefix: "INPUT="
      shellQuote: false
  output_filename:
    type: string?
    doc: "The sorted BAM or SAM output file."
    default: "sorted.bam"
    inputBinding:
      prefix: "OUTPUT="
      shellQuote: false
  sort_order:
    type: string
    doc: "Sort order of output file  Required. Possible values: {unsorted, queryname, coordinate, duplicate}"
    default: "coordinate"
    inputBinding:
      prefix: "SORT_ORDER="
      shellQuote: false
outputs:
  sorted:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)

baseCommand: [java]
arguments:
- valueFrom: "/usr/picard/picard.jar"
  position: -1
  prefix: -jar
- valueFrom: SortSam
  position: 0

