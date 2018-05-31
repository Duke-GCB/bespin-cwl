#!/usr/bin/env cwl-runner
# Based on https://raw.githubusercontent.com/IGS/Chiron/master/pipelines/qiime2/beta_significance.cwl
cwlVersion: v1.0
label: "qiime2: Determine whether groups of samples are significantly different from one another using a permutation-based statistical test"
class: CommandLineTool

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  distance_matrix:
    inputBinding:
      prefix: --i-distance-matrix
    label: Matrix of distances between pairs of samples
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
  output_significance_filename:
    inputBinding:
      prefix: --o-visualization
    label: "resulting visualization filename"
    type: string
outputs:
  out_visual:
    type: File
    outputBinding:
      glob: $(inputs.output_significance_filename)

arguments:
  - prefix: --p-pairwise"

baseCommand: ["qiime", "diversity", "beta-group-significance"]
