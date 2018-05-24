#!/usr/bin/env cwl-runner
# Based on https://raw.githubusercontent.com/IGS/Chiron/master/pipelines/qiime2/alpha_significance.cwl
cwlVersion: v1.0
label: QIIME2 - Perform alpha group significance analysis
class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement

inputs:
  input_dir:
    type: Directory
  vector_file_base:
    type: string
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    type: File
  out_visualization:
    inputBinding:
      prefix: --o-visualization
    type: string
outputs:
  out_visual:
    type: File
    outputBinding:
      glob: $(inputs.out_visualization)

arguments:
  - valueFrom: $(inputs.input_dir.path + '/' + inputs.vector_file_base)
    prefix: --i-alpha-diversity

baseCommand: ["qiime", "diversity", "alpha-group-significance"]
