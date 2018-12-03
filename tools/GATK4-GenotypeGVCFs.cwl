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
      prefix: -R
    secondaryFiles:
    - .amb
    - .ann
    - .bwt
    - .pac
    - .sa
    - .fai
    - ^.dict
    doc: Reference sequence file  Required.
  output_vcf_filename:
    type: string
    inputBinding:
      prefix: -O
    doc: File to which variants should be written  Required.
  dbsnp:
    type: File?
    inputBinding:
      prefix: "-D"
    secondaryFiles:
    - .idx
    doc: "dbSNP file. Default value: null"
  annotation_groups:
    type:
    - 'null'
    - type: array
      items: string
      inputBinding:
        prefix: -G
    doc: One or more groups of annotations to apply to variant calls  This argument may be specified 0 or more times. Default value: [StandardAnnotation].
  only_output_calls_starting_in_intervals
    type: boolean?
    inputBinding:
      prefix: --only_output_calls_starting_in_intervals
    doc: Restrict variant output to sites that start within provided intervals  Default value: false.
  use_new_qual_calculator:
    type: boolean?
    inputBinding:
      prefix: --use-new-qual-calculator
    doc:  If provided, we will use the new AF model instead of the so-called exact model  Default value: false.
  variants:
    type:
      type: array
      items: File
      inputBinding:
        prefix: -V
    inputBinding:
      position: 2
    doc: One or more VCF files containing variants  Required.
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
  java_opt:
    type: string
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true
outputs:
  output_vcf:
    type: File
    outputBinding:
      glob: $(inputs.output_vcf_filename)
    secondaryFiles:
      - .tbi

arguments:
- valueFrom: GenotypeGVCFs
  position: 0
