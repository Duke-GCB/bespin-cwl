#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool


requirements:
- $import: envvar-global.yml
- class: DockerRequirement
  dockerPull: 'dukegcb/gatk-base:3'

inputs: # position 0, for java args, 1 for the jar, 2 for the tool itself

  GATKJar:
    type: File
    inputBinding:
      position: 1
      prefix: -jar

  variant:
    type: File
    secondaryFiles:
    - .idx
    inputBinding:
      position: 2
      prefix: -V
    doc: The raw input variants to be recalibrated

  threads:
    type: int?
    inputBinding:
      position: 2
      prefix: -nt
    doc: multithreading option

  reference:
    type: File
    secondaryFiles:
    - .fai
    - ^.dict
    inputBinding:
      position: 2
      prefix: -R
    doc: reference genome

  intervals:
    type: File[]?
    inputBinding:
      position: 2
      prefix: --intervals
    doc: One or more genomic intervals over which to operate

  genotype_filter_expressions:
    type:
      type: array
      items: string
      inputBinding:
        prefix: -G_filter
    inputBinding:
      position: 2
    doc: One or more expression used with FORMAT (sample/genotype-level) fields to filter (see documentation guide for more info)

  genotype_filter_names:
    type:
      type: array
      items: string
      inputBinding:
        prefix: -G_filterName
    inputBinding:
      position: 2
    doc: Names to use for the list of sample/genotype filters (must be a 1-to-1 mapping); this name is put in the FILTER field for variants that get filtered

  outputfile_filtered_vcf:
    type: string
    inputBinding:
      position: 2
      prefix: -o
    doc: File to which variants should be written

  java_mem:
    type: string
    default: -Xmx8g
    inputBinding:
      position: 0

outputs:
  output_filtered_vcf:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_filtered_vcf)
    doc: The output filtered VCF file


arguments:
- valueFrom: $(runtime.tmpdir)
  position: 0
  separate: false
  prefix: -Djava.io.tmpdir=
- valueFrom: VariantFiltration
  position: 2
  prefix: -T
baseCommand: [java]

