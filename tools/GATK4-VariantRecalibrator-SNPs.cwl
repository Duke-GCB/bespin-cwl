#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  $import: GATK4-requirements.yml
hints:
  - $import: GATK4-hints.yml
baseCommand: gatk

inputs:
  variants:
    type: File
    inputBinding:
      prefix: -V
    secondaryFiles:
      - .idx
    doc: One or more VCF files containing variants  Required.
  output_recalibration_filename:
    type: string
    inputBinding:
      prefix: -O
    doc: The output recal file used by ApplyRecalibration  Required.
  output_tranches_filename:
    type: string
    inputBinding:
      prefix: --tranches-file
    doc:  The output tranches file used by ApplyRecalibration  Required.
  trust_all_polymorphic:
    type: boolean?
    inputBinding:
      prefix: --trust-all-polymorphic
    doc: Trust that all the input training sets' unfiltered records contain only polymorphic sites to drastically speed up the computation.  Default value: false.
  tranches:
    type:
      type: array
      items: string
      inputBinding:
        prefix: -tranche
  annotations:
    type:
      type: array
      items: string
      inputBinding:
        prefix: -an
    doc: The names of the annotations which should used for calculations
  mode:
    type:
      type: enum
      symbols: [SNP,INDEL,BOTH]
    inputBinding:
      prefix: -mode
    doc: Recalibration mode to employ  Default value: SNP. Possible values: {SNP, INDEL, BOTH}
  max_gaussians:
    type: int?
    inputBinding:
      prefix: --max-gaussians
    doc: Max number of Gaussians for the positive model  Default value: 8.
  java_opt:
    type: string
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true
outputs:
  output_recalibration:
    type: File
    outputBinding:
      glob: $(inputs.output_recalibration_filename)
    secondaryFiles:
      - .idx
  output_tranches:
    type: File
    outputBinding:
      glob: $(inputs.output_tranches_filename)


arguments:
- valueFrom: GenotypeGVCFs
  position: 0
