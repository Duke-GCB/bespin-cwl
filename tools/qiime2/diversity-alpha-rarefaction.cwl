#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Generate interactive alpha rarefaction curves by computing rarefactions between a depth range."

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  table:
    type: File
    label: "Feature table to compute rarefaction curves from"
    inputBinding:
      prefix: "--i-table"
  rooted_tree:
    type: File
    label: "phylogeny for phylogenetic metrics"
    inputBinding:
      prefix: "--i-phylogeny"
  max_depth:
    type: int
    label: The maximum rarefaction depth
    inputBinding:
      prefix: "--p-max-depth"
  sample_metadata:
    type: File
    label: Metadata file or artifact viewable as metadata
    inputBinding:
      prefix: "--m-metadata-file"

  alpha_rarefaction_filename:
    type: string
    label: "resulting visualization filename"
    default: "alpha-rarefaction.qzv"
    inputBinding:
      prefix: "--o-visualization"

outputs:
  alpha_rarefaction:
    type: File
    outputBinding:
      glob: $(inputs.alpha_rarefaction_filename)

baseCommand: ["qiime", "diversity", "alpha-rarefaction"]

