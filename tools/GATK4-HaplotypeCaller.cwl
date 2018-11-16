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
  input_bam:
    type: File
    inputBinding:
      prefix: -I
    secondaryFiles:
    - ^.bai
    doc: BAM/SAM/CRAM file containing reads. Required.
  output_variants_filename:
    type: string
    inputBinding:
      prefix: -O
    doc: File to which variants should be written  Required. Use .g.vcf to make a GVCF file.
  output_bam_filename:
    type: string?
    inputBinding:
      prefix: -bamout
    doc:  File to which assembled haplotypes should be written.
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
  annotation_groups:
    type:
    - 'null'
    - type: array
      items: string
      inputBinding:
        prefix: -G
    doc: "One or more groups of annotations to apply to variant calls  This argument may be specified 0 or more times. Default value: [StandardAnnotation, StandardHCAnnotation]."
  dbsnp:
    type: File?
    inputBinding:
      prefix: "-D"
    secondaryFiles:
    - .idx
    doc: "dbSNP file. Default value: null"
  emit_ref_confidence:
    type: string?
    inputBinding:
      prefix: "-ERC"
    doc: "Mode for emitting reference confidence scores  Default value: NONE. Possible values: {NONE, BP_RESOLUTION, GVCF}"
  java_opt:
    type: string
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true

outputs:
  output_variants:
    type: File
    outputBinding:
      glob: $(inputs.output_variants_filename)
    secondaryFiles:
      - .idx
  output_bam:
    type: File
    outputBinding:
      glob: $(inputs.output_bam_filename)
    secondaryFiles:
      - .bai

arguments:
- valueFrom: HaplotypeCaller
  position: 0
