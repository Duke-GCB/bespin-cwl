#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2
inputs:
  rooted_tree: File
  table: File
  sample_metadata: File
  diversity_sampling_depth: int
  rarefaction_max_depth: int

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
  unweighted_unifrac_body_site_significance_file:
     type: File
     outputSource: alpha_beta_diversity/unweighted_unifrac_body_site_significance_file
  unweighted_unifrac_subject_group_significance_file:
     type: File
     outputSource: alpha_beta_diversity/unweighted_unifrac_subject_group_significance_file
  unweighted_unifrac_emperor_file:
     type: File
     outputSource: alpha_beta_diversity/unweighted_unifrac_emperor_file
  bray_curtis_emperor_file:
     type: File
     outputSource: alpha_beta_diversity/bray_curtis_emperor_file

  alpha_rarefaction_file:
     type: File
     outputSource: alpha_rarefaction/alpha_rarefaction_file

steps:
  alpha_beta_diversity:
    run: ../subworkflows/qiime2-06-alpha-beta-diversity.cwl
    in:
      rooted_tree: rooted_tree
      table: table
      sampling_depth: diversity_sampling_depth
      sample_metadata: sample_metadata
    out:
      - core_metrics_directory
      - faith_pd_group_significance_file
      - evenness_group_significance_file
      - unweighted_unifrac_body_site_significance_file
      - unweighted_unifrac_subject_group_significance_file
      - unweighted_unifrac_emperor_file
      - bray_curtis_emperor_file
  alpha_rarefaction:
    run: ../subworkflows/qiime2-07-alpha-rarefaction.cwl
    in:
      table: table
      rooted_tree: rooted_tree
      max_depth: rarefaction_max_depth
      sample_metadata: sample_metadata
    out:
      - alpha_rarefaction_file
