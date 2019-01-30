#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: 'broadinstitute/genomes-in-the-cloud:2.3.1-1512499786'
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
    - entryname: bwa-mem-samtools.sh
      entry: |
        set -o pipefail
        /usr/gitc/bwa mem $@ | samtools view -1 -
baseCommand: bash
arguments: [bwa-mem-samtools.sh]

hints:
- class: SoftwareRequirement
  packages:
      bwa:
          version: [ "0.7.15" ]
          s:citation: https://dx.doi.org/10.1093/bioinformatics/btp324
      samtools:
          version: [ "1.3.1" ]
          s:citation: https://doi.org/10.1093/bioinformatics/btp352

inputs:
  minimum_seed_length:
    type: int?
    inputBinding:
      position: 1
      prefix: -k
    doc: -k INT        minimum seed length [19]
  reference:
    type: File
    inputBinding:
      position: 2
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa

  output_filename: string
  reads:
    type:
      type: array
      items: File
    inputBinding:
      position: 3

  threads:
    type: int
    inputBinding:
      position: 1
      prefix: -t
    doc: -t INT        number of threads [1]

  min_std_max_min:
    type: int[]?
    inputBinding:
      position: 1
      prefix: -I
      itemSeparator: ','

  read_group_header:
    type: string?
    inputBinding:
      position: 1
      prefix: -R
    doc: -R STR        read group header line such as '@RG\tID:foo\tSM:bar' [null]

  smart_pairing:
    type: boolean
    default: false
    inputBinding:
      prefix: -p
    doc: smart pairing (ignoring in2.fq)

  verbosity:
    type: int?
    inputBinding:
      prefix: -v
    doc: "verbose level: 1=error, 2=warning, 3=message, 4+=debugging [3]"

  soft_clipping:
    type: boolean
    default: false
    inputBinding:
      prefix: -Y

stdout: $(inputs.output_filename)

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
