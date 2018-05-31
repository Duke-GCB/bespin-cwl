#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/taxonomic_analysis.cwl

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Classify reads by taxon using a fitted classifier"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  rep_seqs:
    inputBinding:
      prefix: --i-reads
    label: The feature data to be classified
    type: File
  classifier:
    inputBinding:
      prefix: --i-classifier
    label: The taxonomic classifier for classifying the reads
    type: File
  taxonomy_filename:
    inputBinding:
      prefix: --o-classification
    label: Resulting taxonomy filename
    type: string
    default: 'taxonomy.qza'
outputs:
  out_taxa:
    type: File
    outputBinding:
      glob: $(inputs.taxonomy_filename)

baseCommand: ["qiime", "feature-classifier", "classify-sklearn"]
