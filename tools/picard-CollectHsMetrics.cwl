#!/usr/bin/env cwl-runner
# https://broadinstitute.github.io/picard/command-line-overview.html#CollectHsMetrics

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: dukegcb/picard:2.10.7
- class: InlineJavascriptRequirement

inputs:
  input_file:
    type: File
    doc: "The BAM or SAM file to collect metrics from.  Required."
    inputBinding:
      prefix: "I="
      shellQuote: false
  output_filename:
    type: string?
    doc: "The metrics output filename."
    default: "hs_metrics.txt"
    inputBinding:
      prefix: "O="
      shellQuote: false
  reference_sequence:
    type: File
    doc: "The reference sequences in fasta format."
    inputBinding:
      prefix: "R="
      shellQuote: false
  bait_intervals:
    type: File[]
    doc: "The bait interval file in picard interval_list format (from capture kit)."
    inputBinding:
      prefix: "BAIT_INTERVALS="
      shellQuote: false
  target_intervals:
    type: File[]
    doc: "The target interval file in picard interval_list format (from capture kit)."
    inputBinding:
      prefix: "TARGET_INTERVALS="
      shellQuote: false
outputs:
  output_hs_metrics_file:
    type: File[]
    outputBinding:
      glob: $(inputs.output_filename)

baseCommand: ["java", "-Xmx4g"]
arguments:
- valueFrom: "/opt/picard/picard.jar"
  position: -1
  prefix: -jar
- valueFrom: CollectHsMetrics
  position: 0

