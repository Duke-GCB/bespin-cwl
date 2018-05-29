#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/taxonomic_analysis.cwl

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement

hints:
  DockerRequirement:
    dockerPull: qiime2/core:2018.4

inputs:
  rep_seqs:
    inputBinding:
      prefix: --i-reads
    type: File
  classifier:
    inputBinding:
      prefix: --i-classifier
    type: File
  taxonomy_filename:
    inputBinding:
      prefix: --o-classification
    type: string
    default: 'taxonomy.qza'
outputs:
  out_taxa:
    type: File
    outputBinding:
      glob: $(inputs.taxonomy_filename)

baseCommand: ["qiime", "feature-classifier", "classify-sklearn"]
