#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement

hints:
  DockerRequirement:
    dockerPull: qiime2/core:2018.4

inputs:
  tree:
    type: File
    doc: "phylogenetic tree to be rooted"
    inputBinding:
      prefix: "--i-tree"
  rooted_tree_filename:
    type: string
    doc: "rooted phylogenetic tree"
    inputBinding:
      prefix: "--o-rooted-tree"
outputs:
  rooted_tree:
    type: File
    outputBinding:
      glob: $(inputs.rooted_tree_filename)

baseCommand: ["qiime", "phylogeny", "midpoint-root"]
