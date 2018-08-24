#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: dukegcb/picard:2.10.7
- class: InlineJavascriptRequirement
hints:
- class: SoftwareRequirement
  packages:
      picard:
          version: [ "2.10.6" ]
          s:citation: http://broadinstitute.github.io/picard
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
    default: "marked_duplicates.bam"
    inputBinding:
      prefix: "OUTPUT="
      shellQuote: false
  metrics_filename:
    type: string?
    doc: "Output metrics filename"
    default: "marked_dup_metrics.txt"
    inputBinding:
      prefix: "METRICS_FILE="
      shellQuote: false
  remove_duplicates:
    type: boolean
    doc: "If true do not write duplicates to the output file instead of writing them with appropriate flags set.  (Default true)."
    default: true
    inputBinding:
      prefix: "REMOVE_DUPLICATES="
      shellQuote: false
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

baseCommand: [picard]
arguments:
- valueFrom: MarkDuplicates
  position: 0
- valueFrom: "CREATE_INDEX=True"
  position: 0

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
