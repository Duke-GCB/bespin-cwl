#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Construct a phylogenetic tree with FastTree"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  alignment:
    type: File
    label: "aligned sequences to be used for phylogenetic reconstruction"
    inputBinding:
      prefix: "--i-alignment"
  tree_filename:
    type: string
    label: "resulting phylogenetic tree filename"
    inputBinding:
      prefix: "--o-tree"
outputs:
  unrooted_tree:
    type: File
    outputBinding:
      glob: $(inputs.tree_filename)

baseCommand: ["qiime", "phylogeny", "fasttree"]
