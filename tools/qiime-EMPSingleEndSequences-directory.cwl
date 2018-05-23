cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: ShellCommandRequirement

inputs:
  sequences:
    type: File
  barcodes:
    type: File
  directory_name:
    type: string
    default: emp-single-end-sequences

arguments:
  - mkdir
  - $(inputs.directory_name)
  - '&&'
  - cp
  - $(inputs.sequences.path)
  - $(inputs.directory_name)/sequences.fastq.gz
  - '&&'
  - cp
  - $(inputs.barcodes.path)
  - $(inputs.directory_name)/barcodes.fastq.gz

outputs:
  dir:
    type: Directory
    outputBinding:
      glob: $(inputs.directory_name)
