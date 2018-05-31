#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  table:
    type: File
    doc: "feature table to be summarized"
    inputBinding:
      prefix: "--i-table"
  sample_metadata_file:
    type: File
    doc: "metadata file or artifact viewable as metadata"
    inputBinding:
      prefix: "--m-metadata-file"
  filter_where:
    type: string
    default: "BodySite='gut'"
    inputBinding:
      prefix: "--p-where"
  filtered_table_filename:
    type: string
    doc: "?"
    inputBinding:
      prefix: "--o-filtered-table"

outputs:
  filtered_table:
    type: File
    outputBinding:
      glob: $(inputs.filtered_table_filename)

baseCommand: ["qiime", "feature-table", "filter-samples"]
