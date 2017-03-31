#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: 'dukegcb/fastqc'

requirements:
  - class: InlineJavascriptRequirement

inputs:
  input_fastq_file:
    type: File
    inputBinding:
      position: 4
  noextract:
    type: boolean
    default: true
    inputBinding:
      prefix: "--noextract"
      position: 2
  format:
    type: string
    default: "fastq"
    inputBinding:
      position: 3
      prefix: "--format"
  threads:
    type: int
    default: 1
    inputBinding:
      position: 5
      prefix: "--threads"


outputs:
  output_qc_report:
    type: File
    outputBinding:
      glob: "*_fastqc.zip"

baseCommand: fastqc
arguments:
  - valueFrom: $('/tmp')
    prefix: "--dir"
    position: 5
  - valueFrom: $(runtime.outdir)
    prefix: "-o"
    position: 5
