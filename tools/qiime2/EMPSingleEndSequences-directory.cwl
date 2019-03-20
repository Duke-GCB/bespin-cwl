cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Creates a directory populated with specifically named files as required by qiime2 EMPSingleEndSequences"

requirements:
  - class: ShellCommandRequirement

inputs:
  sequences:
    type: File
    label: sequence reads
  barcodes:
    type: File
    label: barcode read associated with each sequence
  directory_name:
    type: string
    label: Name of the resulting directory
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
