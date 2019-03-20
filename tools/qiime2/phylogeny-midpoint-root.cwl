#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Midpoint root an unrooted phylogenetic tree"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  tree:
    type: File
    label: "phylogenetic tree to be rooted"
    inputBinding:
      prefix: "--i-tree"
  rooted_tree_filename:
    type: string
    label: "rooted phylogenetic tree"
    inputBinding:
      prefix: "--o-rooted-tree"
outputs:
  rooted_tree:
    type: File
    outputBinding:
      glob: $(inputs.rooted_tree_filename)

baseCommand: ["qiime", "phylogeny", "midpoint-root"]
