cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Creates a directory populated with specifically named files as required by qiime2 EMPPairedEndSequences"

requirements:
  - class: ShellCommandRequirement

inputs:
  forward_sequences:
    type: File
    label: forward sequence reads
  reverse_sequences:
    type: File
    label: reverse sequence reads
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
  - $(inputs.forward_sequences.path)
  - $(inputs.directory_name)/forward.fastq.gz
  - '&&'
  - cp
  - $(inputs.reverse_sequences.path)
  - $(inputs.directory_name)/reverse.fastq.gz
  - '&&'
  - cp
  - $(inputs.barcodes.path)
  - $(inputs.directory_name)/barcodes.fastq.gz

outputs:
  dir:
    type: Directory
    outputBinding:
      glob: $(inputs.directory_name)
