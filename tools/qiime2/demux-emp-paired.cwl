#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Demultiplex paired-end sequence data for data generated with the Earth Microbiome Project (EMP) amplicon sequencing protocol"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  seqs:
    type: File
    label: "qiime2 artifact file with formats (EMPPairedEndSequences | EMPSingleEndSequences | RawSequences)"
    inputBinding:
      prefix: "--i-seqs"
  barcodes_file:
    type: File
    label: "Metadata file or artifact viewable as metadata"
    inputBinding:
      prefix: "--m-barcodes-file"
  barcodes_column:
    type: string
    label: "Column from metadata file or artifact viewable as metadata"
    inputBinding:
      prefix: "--m-barcodes-column"
  per_sample_sequences_filename:
    type: string
    label: "Filename for the resulting demultiplexed sequences"
    inputBinding:
      prefix: "--o-per-sample-sequences"
  rev_comp_mapping_barcodes:
    type: boolean
    label: "the barcode sequences in the sample metadata will be reverse complement prior to demultiplexing"
    inputBinding:
       prefix: "--p-rev-comp-mapping-barcodes"
outputs:
  demux_sequences_artifact:
    type: File
    outputBinding:
      glob: $(inputs.per_sample_sequences_filename)

baseCommand: ["qiime", "demux", "emp-paired"]

