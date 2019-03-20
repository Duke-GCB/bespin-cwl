#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2 rarefaction visualization
doc: "Alpha rarefaction plotting from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/"

inputs:
  table: File
  rooted_tree: File
  max_depth: int
  sample_metadata: File

outputs:
  alpha_rarefaction_file:
     type: File
     outputSource: alpha_rarefaction/alpha_rarefaction
steps:
  alpha_rarefaction:
    run: ../tools/qiime2/diversity-alpha-rarefaction.cwl
    in:
      table: table
      rooted_tree: rooted_tree
      max_depth: max_depth
      sample_metadata: sample_metadata
    out:
      - alpha_rarefaction
