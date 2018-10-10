#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  $import: GATK4-requirements.yml
# hints:      # Removing this to suppress noise
#   - $import: GATK4-hints.yml
baseCommand: gatk
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
  java_opt:
    type: string?
    doc: "String of options to pass to JVM at runtime"
    default:
      "-Xms4000m"
    inputBinding:
      prefix: "--java-options"
      position: 0 # before the tool name
    
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
  position: 1

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
