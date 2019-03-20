#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/diff_abundance.cwl

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Apply ANCOM to identify features that are differentially abundant across groups"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  comp_table:
    inputBinding:
      prefix: --i-table
    label: The feature table to be used for ANCOM computation
    type: File
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    label: Metadata file or artifact viewable as metadata
    type: File
  metadata_column:
    inputBinding:
      prefix: --m-metadata-column
    label: Column from metadata file or artifact viewable as metadata
    type: string
  feat_visualization:
    inputBinding:
      prefix: --o-visualization
    label: Resulting visualization filename
    type: string
    default: 'ancom.qzv'

outputs:
  out_visual:
    type: File
    outputBinding:
      glob: $(inputs.feat_visualization)

baseCommand: ["qiime", "composition", "ancom"]
