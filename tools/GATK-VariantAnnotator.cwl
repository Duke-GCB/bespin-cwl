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

  annotation:
    type:
      type: array
      items: string
      inputBinding:
        prefix: -A
    inputBinding:
      position: 2
    doc: One or more specific annotations to apply to variant calls

  ped:
    type: File?
    inputBinding:
      position: 2
      prefix: -ped
    doc: Pedigree files for samples

  outputfile_annotated_vcf:
    type: string
    inputBinding:
      position: 2
      prefix: -o
    doc: File to which annotated variants should be written

  java_mem:
    type: string
    default: -Xmx8g
    inputBinding:
      position: 0

outputs:
  output_annotated_vcf:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_annotated_vcf)
    doc: The output filtered VCF file

arguments:
- valueFrom: $(runtime.tmpdir)
  position: 0
  separate: false
  prefix: -Djava.io.tmpdir=
- valueFrom: VariantAnnotator
  position: 2
  prefix: -T
baseCommand: [java]
