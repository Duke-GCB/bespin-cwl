#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: 'scidap/star:v2.5.0b'

inputs:
  genomeDir:
    type:
      type: array
      items: File
    label: 'STAR genome files, generated previously with generateGenome'
    inputBinding:
      prefix: '--genomeDir'
  readFilesIn:
    type:
      type: array
      items: File
    label: 'paths to files that contain input read1 (and, if needed,  read2)'
    inputBinding:
      prefix: '--readFilesIn'
      shellQuote: false
  runThreadN:
    type: int?
    label: 'number of threads to run STAR (default: 1)'
    inputBinding:
      prefix: '--runThreadN'
  outFilterMultimapNmax:
    type: int?
    label: 'read alignments will be output only if the read maps fewer than this (default: 10)'
    inputBinding:
      prefix: '--outFilterMultimapNmax'
  outSAMattributes:
    type: string?
    label: 'a string of desired SAM attributes, in the order desired for the output (default: Standard)'
    inputBinding:
      prefix: '--outSAMattributes'
      shellQuote: false
  outSAMstrandField:
    type: string?
    label: 'Cufflinks-like strand field flag (default: None)'
    inputBinding:
      prefix: '--outSAMstrandField'
  outSAMtype:
    type:
      type: array
      items: string
    default: ["BAM","SortedByCoordinate"]
    label: 'Type of SAM/BAM output (default: BAM, SortedByCoordinate)'
    inputBinding:
      prefix: '--outSAMtype'
  alignSJoverhangMin:
    type: int?
    label: 'int>0: minimum overhang (i.e. block size) for spliced alignments (default: 5)'
    inputBinding:
      prefix: '--alignSJoverhangMin'
  outFileNamePrefix:
    type: string?
    label: 'string: output files name prefix (including full or relative path)'
    inputBinding:
      prefix: '--outFileNamePrefix'
outputs:
  outfiles:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*"
baseCommand: STAR
