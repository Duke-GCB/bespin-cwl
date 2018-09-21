#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: 'dukegcb/fastqc:0.11.4'
  - class: SoftwareRequirement
    packages:
      fastqc:
        version: [ "0.11.4" ]
        s:citation: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/

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
    doc: The number of threads to use. The fastqc wrapper script requests 250MB of memory per thread, so keep this in line with any CWL ResourceRequirement
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

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
