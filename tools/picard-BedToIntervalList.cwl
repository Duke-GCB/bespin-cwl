#!/usr/bin/env cwl-runner
# https://broadinstitute.github.io/picard/command-line-overview.html#BedToIntervalList

cwlVersion: v1.0
class: CommandLineTool

requirements:
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
    type: File[]?
    doc: "The bed file to be converted to interval_list format.  Required."
    inputBinding:
      prefix: "I="
      shellQuote: false
  output_filename:
    type: string?
    doc: "Interval list output filename."
    default: "list.interval_list"
    inputBinding:
      prefix: "O="
      shellQuote: false
  reference_sequence:
    type: File
    doc: "The reference sequences in fasta format."
    inputBinding:
      prefix: "SD="
      shellQuote: false
outputs:
  output_interval_list_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)

baseCommand: ["java", "-Xmx4g"]
arguments:
- valueFrom: "/opt/picard/picard.jar"
  position: -1
  prefix: -jar
- valueFrom: BedToIntervalList
  position: 0

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
