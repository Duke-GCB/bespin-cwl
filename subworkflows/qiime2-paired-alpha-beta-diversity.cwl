#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
- class: StepInputExpressionRequirement
label: qiime2 diversity analyses
doc: "Alpha and beta diversity analysis"

inputs:
  rooted_tree: File
  table: File
  sampling_depth: int
  sample_metadata: File

  faith_pd_group_significance_filename:
    type: string
    default: 'faith-pd-group-significance.qzv'
  evenness_group_significance_filename:
    type: string
    default: 'evenness-group-significance.qzv'
  shannon_group_significance_filename:
    type: string
    default: 'shannon-group-significance.qzv'
  unweighted_unifrac_body_site_significance_filename:
    type: string
    default: 'unweighted-unifrac-body-site-significance.qzv'
  unweighted_unifrac_significance_filename:
    type: string
    default: 'unweighted-unifrac-significance.qzv'


outputs:
  core_metrics_directory:
    type: Directory
    outputSource: generate_core_metrics/out_dir
  faith_pd_group_significance_file:
    type: File
    outputSource: faith_pd_group_significance/significance
  evenness_group_significance_file:
    type: File
    outputSource: evenness_group_significance/significance
  shannon_group_significance_file:
    type: File
    outputSource: shannon_group_significance/significance
  unweighted_unifrac_significance_file:
    type: File
    outputSource: unweighted_unifrac_significance/out_visual


steps:
  generate_core_metrics:
    run: ../tools/qiime2/diversity-core-metrics-phylogenetic.cwl
    in:
      input_tree: rooted_tree
      input_table: table
      sampling_depth: sampling_depth
      metadata_file: sample_metadata
    out:
      - out_dir
      - faith_pd_vector
      - evenness_vector
      - unweighted_unifrac_distance_matrix
      - unweighted_unifrac_pcoa_results
      - bray_curtis_pcoa_results
      - shannon_vector
  faith_pd_group_significance:
    run: ../tools/qiime2/diversity-alpha-group-significance.cwl
    in:
      alpha_diversity: generate_core_metrics/faith_pd_vector
      metadata_file: sample_metadata
      output_significance_filename: faith_pd_group_significance_filename
    out:
      - significance
  evenness_group_significance:
    run: ../tools/qiime2/diversity-alpha-group-significance.cwl
    in:
      alpha_diversity: generate_core_metrics/evenness_vector
      metadata_file: sample_metadata
      output_significance_filename: evenness_group_significance_filename
    out:
      - significance
  shannon_group_significance:
    run: ../tools/qiime2/diversity-alpha-group-significance.cwl
    in:
      alpha_diversity: generate_core_metrics/shannon_vector
      metadata_file: sample_metadata
      output_significance_filename: shannon_group_significance_filename
    out:
      - significance
  unweighted_unifrac_significance:
    run: ../tools/qiime2/diversity-beta-group-significance.cwl
    in:
      distance_matrix: generate_core_metrics/unweighted_unifrac_distance_matrix
      metadata_file: sample_metadata
      metadata_column:
        valueFrom: 'TransectName'
      output_significance_filename: unweighted_unifrac_significance_filename
    out:
      - out_visual
