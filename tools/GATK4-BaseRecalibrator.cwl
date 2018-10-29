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
  use_original_qualities:
    type: boolean
    default: false
    inputBinding:
      prefix: "--use-original-qualities"
  output_recalibration_report_filename:
    type: string
    doc: "Recalibration Report Filename"
    default: "recal.csv"
    inputBinding:
      prefix: "-O"
  known_sites:
    type:
    - 'null'
    - type: array
      items: File
      inputBinding:
        prefix: --known-sites
    secondaryFiles:
      - .idx
    doc: Any number of VCF files representing known SNPs and/or indels. Could be e.g.
      dbSNP and/or official 1000 Genomes indel calls. SNPs in these files will be
      ignored unless the --mismatchFraction argument is used. optional parameter.
  intervals:
    type:
    - 'null'
    - type: array
      items: File
      inputBinding:
        prefix: -L
    doc: One or more genomic intervals over which to operate
  java_opt:
    type: string
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true
  
outputs:
  output_recalibration_report:
    type: File
    outputBinding:
      glob: $(inputs.output_recalibration_report_filename)

arguments:
- valueFrom: BaseRecalibrator
  position: 0
