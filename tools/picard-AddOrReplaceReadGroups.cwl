#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: dukegcb/picard:v2.5.0
- class: InlineJavascriptRequirement

inputs:
  input_file:
    type: File
    doc: 'One or more input SAM or BAM files to analyze. Must be coordinate sorted.'
    inputBinding:
      prefix: "INPUT="
      shellQuote: false
  output_filename:
    type: string?
    doc: "Output filename"
    default: "with_read_groups.bam"
    inputBinding:
      prefix: "OUTPUT="
      shellQuote: false
  sort_order:
    type: string?
    doc: "Optional sort order to output in. If not supplied OUTPUT is in the same order as INPUT.  Default value: null. Possible values: {unsorted, queryname, coordinate, duplicate}."
    inputBinding:
      prefix: "SORT_ORDER="
      shellQuote: false
  read_group_id:
    type: string?
    doc: "Read Group ID  Default value: 1. This option can be set to 'null' to clear the default value."
    inputBinding:
      prefix: "RGID="
      shellQuote: false
  read_group_library:
    type: string
    doc: "Read Group library  Required."
    inputBinding:
      prefix: "RGLB="
      shellQuote: false
  read_group_platform:
    type: string
    doc: "Read Group platform (e.g. illumina, solid)  Required."
    inputBinding:
      prefix: "RGPL="
      shellQuote: false
  read_group_platform_unit:
    type: string
    doc: "Read Group platform unit (eg. run barcode)  Required."
    inputBinding:
      prefix: "RGPU="
      shellQuote: false
  read_group_sample_name:
    type: string
    doc: "Read Group sample name  Required."
    inputBinding:
      prefix: "RGSM="
      shellQuote: false 
  create_index:
    type: boolean
    doc: "If true, create an index"
    default: true
    inputBinding:
      prefix: "CREATE_INDEX=True"
      shellQuote: false
outputs:
  output:
    type: File
    secondaryFiles:
      - ^.bai
    outputBinding:
      glob: $(inputs.output_filename)

baseCommand: [java]
arguments:
- valueFrom: "/usr/picard/picard.jar"
  position: -1
  prefix: -jar
- valueFrom: AddOrReplaceReadGroups
  position: 0

