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
    doc: "The BAM or SAM file to fix"
    inputBinding:
      prefix: "--INPUT"
  output_filename:
    type: string
    doc: "The fixed BAM or SAM output file"
    default: "fixed.bam"
    inputBinding:
      prefix: "--OUTPUT"
  create_index:
    type: string
    default: "true"
    inputBinding:
      prefix: "--CREATE_INDEX"
    doc: "Create an index"
  reference:
    type: File
    secondaryFiles:
    - .fai
    - ^.dict
    doc: "Reference sequence file"
    inputBinding:
      prefix: "--REFERENCE_SEQUENCE"
  java_opt:
    type: string
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true
outputs:
  output_fixed_tags_bam:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
    secondaryFiles:
      - ^.bai

arguments:
- valueFrom: SetNmAndUqTags
  position: 0
