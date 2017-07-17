#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool


requirements:
- $import: envvar-global.yml
- $import: GATK-docker.yml

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

  supporting:
    type:
      type: array
      items: File
      inputBinding:
        prefix: --supporting
    inputBinding:
      position: 2
    doc: Other callsets to use in generating genotype posteriors

  ped:
    type: File?
    inputBinding:
      position: 2
      prefix: -ped
    doc: Pedigree files for samples

  outputfile_cgp_vcf:
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
  output_cgp_vcf:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_cgp_vcf)
    doc: The output recalibration VCF file


arguments:
- valueFrom: $(runtime.tmpdir)
  position: 0
  separate: false
  prefix: -Djava.io.tmpdir=
- valueFrom: CalculateGenotypePosteriors
  position: 2
  prefix: -T
baseCommand: [java]
