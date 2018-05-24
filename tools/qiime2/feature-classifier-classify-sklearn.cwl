#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/taxonomic_analysis.cwl

class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement

inputs:
  rep_seqs:
    inputBinding:
      prefix: --i-reads
    type: File
  classifier:
    inputBinding:
      prefix: --i-classifier
    type: File
  taxonomy:
    inputBinding:
      prefix: --o-classification
    type: string
    default: 'taxonomy.qza'
outputs:
  out_taxa:
    type: File
    outputBinding:
      glob: $(inputs.taxonomy)

baseCommand: ["qiime", "feature-classifier", "classify-sklearn"]
