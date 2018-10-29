#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  $import: GATK4-requirements.yml
hints:
  - $import: GATK4-hints.yml
baseCommand: gatk
inputs:
  input_file:
    type: File
    doc: "One or more input SAM or BAM files to sort"
    inputBinding:
      prefix: "--INPUT"
  output_sorted_bam_filename:
    type: string
    doc: "Output filename"
    default: "sorted.bam"
    inputBinding:
      prefix: "--OUTPUT"
  sort_order:
    type: string
    doc: "Sort order (e.g. coordinate)"
    inputBinding:
      prefix: "--SORT_ORDER"
  create_index:
    type: string
    default: "false"
    inputBinding:
      prefix: "--CREATE_INDEX"
    doc: "Create an index"
  java_opt:
    type: string?
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true
    
outputs:
  output_sorted_bam:
    type: File
    outputBinding:
      glob: $(inputs.output_sorted_bam_filename)
    secondaryFiles:
      - ^.bai

arguments:
- valueFrom: SortSam
  position: 0
