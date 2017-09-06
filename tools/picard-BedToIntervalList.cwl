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
    type: File[]?
    doc: "The bed file to be converted to interval_list format.  Required."
    inputBinding:
      prefix: "I="
      shellQuote: false
  reference_sequence:
    type: File
    doc: "The reference sequences in fasta format."
    inputBinding:
      prefix: "SD="
      shellQuote: false
outputs:
  output_interval_list_file:
    type: File[]?
    outputBinding:
      glob: $(inputs.input_file.path + '.interval_list')

baseCommand: ["java", "-Xmx4g"]
arguments:
- valueFrom: "/opt/picard/picard.jar"
  position: -1
  prefix: -jar
- valueFrom: BedToIntervalList
  position: 0
- valueFrom: $(inputs.input_file.path + '.interval_list')
  prefix: "O="
  separate: false


