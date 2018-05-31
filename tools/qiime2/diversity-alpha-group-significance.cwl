#!/usr/bin/env cwl-runner
# Based on https://raw.githubusercontent.com/IGS/Chiron/master/pipelines/qiime2/alpha_significance.cwl
cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Visually and statistically compare groups of alpha diversity values"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  alpha_diversity:
    inputBinding:
      prefix: --i-alpha-diversity
    label: Vector of alpha diversity values by sample
    type: File
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    label: Metadata file or artifact viewable as metadata
    type: File
  output_significance_filename:
    inputBinding:
      prefix: --o-visualization
    label: The resulting visualization filename
    type: string

outputs:
  significance:
    type: File
    outputBinding:
      glob: $(inputs.output_significance_filename)

baseCommand: ["qiime", "diversity", "alpha-group-significance"]
