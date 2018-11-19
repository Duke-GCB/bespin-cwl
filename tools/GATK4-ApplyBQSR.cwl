#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  $import: GATK4-requirements.yml
hints:
  - $import: GATK4-hints.yml
baseCommand: gatk

inputs:
  reference:
    type: File
    inputBinding:
      position: 2
      prefix: -R
    secondaryFiles:
    - .amb
    - .ann
    - .bwt
    - .pac
    - .sa
    - .fai
    - ^.dict
  input_bam:
    type: File
    inputBinding:
      prefix: -I
    secondaryFiles:
    - ^.bai
    doc: input bam
  output_recalibrated_bam_filename:
    type: string
    doc: "Output BAM filename"
    default: "recalibrated.bam"
    inputBinding:
      prefix: "-O"
  intervals:
    type:
    - 'null'
    - type: array
      items: File
      inputBinding:
        prefix: -L
    doc: One or more genomic intervals over which to operate
  interval_padding:
    type: int?
    doc: "Amount of padding (in bp) to add to each interval you are including. Defaults to 0"
    inputBinding:
      prefix: "-ip"
  bqsr_report:
    type: File
    doc: "BQSR recalibration report"
    inputBinding:
      prefix: -bqsr
  static_quantized_quals:
    type:
    - 'null'
    - type: array
      items: int
      inputBinding:
        prefix: "--static-quantized-quals"
    doc:  Use static quantized quality scores to a given number of levels (with -bqsr)
  add_output_sam_program_record:
    type: boolean
    default: false
    inputBinding:
      prefix: --add-output-sam-program-record
  use_original_qualities:
    type: boolean
    default: false
    inputBinding:
      prefix: "--use-original-qualities"
  java_opt:
    type: string
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true

outputs:
  output_recalibrated_bam:
    type: File
    outputBinding:
      glob: $(inputs.output_recalibrated_bam_filename)
    secondaryFiles:
      - .bai

arguments:
- valueFrom: ApplyBQSR
  position: 0
