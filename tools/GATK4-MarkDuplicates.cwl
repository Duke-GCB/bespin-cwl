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
    doc: 'One or more input SAM or BAM files to analyze. Must be coordinate sorted.'
    inputBinding:
      prefix: "--INPUT"
  output_filename:
    type: string
    doc: "Output filename"
    default: "marked_duplicates.bam"
    inputBinding:
      prefix: "--OUTPUT"
  metrics_filename:
    type: string
    doc: "Output metrics filename"
    default: "marked_dup_metrics.txt"
    inputBinding:
      prefix: "--METRICS_FILE"
  validation_stringency:
    type: string?
    inputBinding:
      prefix: "--VALIDATION_STRINGENCY"
  optical_duplicate_pixel_distance:
    type: int?
    inputBinding:
      prefix: "--OPTICAL_DUPLICATE_PIXEL_DISTANCE"
  assume_sort_order:
    type: string?
    inputBinding:
      prefix: "--ASSUME_SORT_ORDER"
  create_index:
    type: string
    default: "false"
    inputBinding:
      prefix: "--CREATE_INDEX"
    doc: "Create an index"
  remove_duplicates:
    type: string?
    doc: "If true do not write duplicates to the output file instead of writing them with appropriate flags set.  (Default true)."
    inputBinding:
      prefix: "--REMOVE_DUPLICATES:"
      shellQuote: false
  java_opt:
    type: string?
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true
outputs:
  output_metrics_file:
    type: File
    outputBinding:
      glob: $(inputs.metrics_filename)
  output_dedup_bam_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
    secondaryFiles:
      - ^.bai

arguments:
- valueFrom: MarkDuplicates
  position: 0
