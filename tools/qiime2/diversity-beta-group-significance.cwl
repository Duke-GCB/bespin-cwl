#!/usr/bin/env cwl-runner
# Based on https://raw.githubusercontent.com/IGS/Chiron/master/pipelines/qiime2/beta_significance.cwl
cwlVersion: v1.0
label: QIIME2 - Perform beta group significance analysis
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement

inputs:
  distance_matrix:
    inputBinding:
      prefix: --i-distance-matrix
    type: File
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    type: File
  metadata_column:
    inputBinding:
      prefix: --m-metadata-column
    type: string
  output_significance_filename:
    inputBinding:
      prefix: --o-visualization
    type: string
outputs:
  out_visual:
    type: File
    outputBinding:
      glob: $(inputs.output_significance_filename)

arguments:
  - prefix: --p-pairwise"

baseCommand: ["qiime", "diversity", "beta-group-significance"]
