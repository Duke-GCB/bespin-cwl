#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: QIIME2 Step 3
doc: |
  QIIME2 Alpha/beta diversity analysis and Alpha rarefaction plotting

inputs:
  rooted_tree: File
  table: File
  sample_metadata: File
  diversity_sampling_depth: int
  unweighted_unifrac_metadata_column: string

outputs:
  core_metrics_directory:
     type: Directory
     outputSource: alpha_beta_diversity/core_metrics_directory
  faith_pd_group_significance_file:
     type: File
     outputSource: alpha_beta_diversity/faith_pd_group_significance_file
  evenness_group_significance_file:
     type: File
     outputSource: alpha_beta_diversity/evenness_group_significance_file
  shannon_group_significance_file:
     type: File
     outputSource: alpha_beta_diversity/shannon_group_significance_file
  unweighted_unifrac_significance_file:
     type: File
     outputSource: alpha_beta_diversity/unweighted_unifrac_significance_file

steps:
  alpha_beta_diversity:
    run: ../subworkflows/qiime2-paired-alpha-beta-diversity.cwl
    in:
      rooted_tree: rooted_tree
      table: table
      sampling_depth: diversity_sampling_depth
      sample_metadata: sample_metadata
      unweighted_unifrac_metadata_column: unweighted_unifrac_metadata_column
    out:
      - core_metrics_directory
      - faith_pd_group_significance_file
      - evenness_group_significance_file
      - shannon_group_significance_file
      - unweighted_unifrac_significance_file
