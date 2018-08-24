#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
- class: InlineJavascriptRequirement
- class: SoftwareRequirement
  packages:
      samtools:
          version: [ "1.2" ]
          s:citation: https://doi.org/10.1093/bioinformatics/btp352

inputs:
  output_filename: string
  output_bam_format:
    type: boolean
    inputBinding:
      position: 0
      prefix: "-b"
  input_file:
    type: File
    streamable: True
    inputBinding:
      position: 1
stdout: $(inputs.output_filename)
outputs:
  output:
    type: File
    streamable: True
    outputBinding:
      glob: $(inputs.output_filename)



baseCommand: ['samtools', 'view']
