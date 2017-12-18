#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: 'dukegcb/trim-galore:0.4.4'

  - class: SoftwareRequirement
    packages:
      trimgalore:
        version: [ "0.4.4" ]
        s:citation: https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/
      cutadapt:
        version: [ "1.14" ]
        s:citation: https://dx.doi.org/10.14806/ej.17.1.200

inputs:
  paired:
    type: boolean
    inputBinding:
      position: 1
      prefix: '--paired'
  reads:
    type:
      type: array
      items: File
    inputBinding:
      position: 3

outputs:
  trimmed_reads:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*_val_*.fq*"
  trim_reports:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*_trimming_report.txt"

baseCommand: trim_galore
arguments:
  - valueFrom: $(runtime.outdir)
    prefix: "-o"
    position: 2

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
