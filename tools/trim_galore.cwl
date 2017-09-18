#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: 'dukegcb/trim-galore:0.4.4'
hints:
  SoftwareRequirement:
    packages:
      trim-galore:
        version: [ "0.4.4" ]
      cutadapt:
        version: [ "1.14" ]

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



