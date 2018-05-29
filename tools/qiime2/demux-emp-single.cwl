#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement

hints:
  DockerRequirement:
    dockerPull: qiime2/core:2018.4

inputs:
  seqs:
    type: File
    doc: "qiime2 artifact file with formats (EMPPairedEndSequences | EMPSingleEndSequences | RawSequences)"
    inputBinding:
      prefix: "--i-seqs"
  barcodes_file:
    type: File
    doc: "Metadata file or artifact viewable as metadata"
    inputBinding:
      prefix: "--m-barcodes-file"
  barcodes_column:
    type: string
    doc: "Column from metadata file or artifact viewable as metadata"
    inputBinding:
      prefix: "--m-barcodes-column"
  per_sample_sequences_filename:
    type: string
    doc: "Filename for the resulting demultiplexed sequences"
    inputBinding:
      prefix: "--o-per-sample-sequences"
outputs:
  demux_sequences_artifact:
    type: File
    outputBinding:
      glob: $(inputs.per_sample_sequences_filename)

baseCommand: ["qiime", "demux", "emp-single"]

