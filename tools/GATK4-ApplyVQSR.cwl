#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  $import: GATK4-requirements.yml
hints:
  - $import: GATK4-hints.yml
baseCommand: gatk

inputs:
  output_recalibrated_variants_filename:
    type: string
    inputBinding:
      prefix: -O
      position: 1
    doc: "The output filtered and recalibrated VCF file in which each variant is annotated with its VQSLOD value  Required"
  variants:
    type: File
    inputBinding:
      prefix: -V
      position: 1
    secondaryFiles:
      - .idx
    doc: "One or more VCF files containing variants  This argument must be specified at least once."
  recalibration_file:
    type: File
    inputBinding:
      prefix: --recal-file
      position: 2
    doc: "The input recal file used by ApplyRecalibration  Required."
  tranches_file:
    type: File?
    inputBinding:
      prefix: --tranches-file
      position: 3
    doc: "The input tranches file describing where to cut the data"
  truth_sensitivity_filter_level:
    type: float?
    inputBinding:
      prefix: --truth-sensitivity-filter-level
      position: 4
    doc: "The truth sensitivity level at which to start filtering"
  create_output_variant_index:
    type: boolean?
    inputBinding:
      prefix: --create-output-variant-index
      position: 5
    doc: "Trust that all the input training sets' unfiltered records contain only polymorphic sites to drastically speed up the computation.  Default value: false."
  mode:
    type:
      type: enum
      symbols: [SNP,INDEL,BOTH]
    inputBinding:
      prefix: -mode
      position: 7
    doc: "Recalibration mode to employ  Default value: SNP. Possible values: {SNP, INDEL, BOTH}"
  java_opt:
    type: string
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true
outputs:
  output_recalibrated_variants:
    type: File
    outputBinding:
      glob: $(inputs.output_recalibrated_variants_filename)
    secondaryFiles:
      - .idx

arguments:
- valueFrom: ApplyVQSR
  position: 0
