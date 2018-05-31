#!/usr/bin/env cwl-runner
# Based on https://raw.githubusercontent.com/IGS/Chiron/master/pipelines/qiime2/alpha_significance.cwl
cwlVersion: v1.0
class: CommandLineTool
label: qiime2: Visually and statistically compare groups of alpha diversity values

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  alpha_diversity:
    inputBinding:
      prefix: --i-alpha-diversity
    type: File
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    type: File
  output_significance_filename:
    inputBinding:
      prefix: --o-visualization
    type: string

outputs:
  significance:
    type: File
    outputBinding:
      glob: $(inputs.output_significance_filename)

baseCommand: ["qiime", "diversity", "alpha-group-significance"]
