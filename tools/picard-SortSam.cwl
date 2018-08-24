#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
- class: DockerRequirement
  dockerPull: dukegcb/picard:2.10.7
- class: InlineJavascriptRequirement
- class: SoftwareRequirement
  packages:
      picard:
          version: [ "2.10.7" ]
          s:citation: http://broadinstitute.github.io/picard
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
    secondaryFiles:
      - ^.bai

baseCommand: [picard]
arguments:
- valueFrom: SortSam
  position: 0

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
