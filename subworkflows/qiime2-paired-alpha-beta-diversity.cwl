#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2 diversity analyses
doc: "Alpha and beta diversity analysis"

inputs:
  rooted_tree: File
  table: File
  sampling_depth: int
  sample_metadata: File
  unweighted_unifrac_metadata_column: string
  rarefied_table_filename:
    type: string
    default: rarefied_table.qza
  faith_pd_vector_filename:
    type: string
    default: faith_pd_vector.qza
  observed_otus_vector_filename:
    type: string
    default: observed_otus_vector.qza
  shannon_vector_filename:
    type: string
    default: shannon_vector.qza
  evenness_vector_filename:
    type: string
    default: evenness_vector.qza
  unweighted_unifrac_distance_matrix_filename:
    type: string
    default: unweighted_unifrac_distance_matrix.qza
  weighted_unifrac_distance_matrix_filename:
    type: string
    default: weighted_unifrac_distance_matrix.qza
  jaccard_distance_matrix_filename:
    type: string
    default: jaccard_distance_matrix.qza
  bray_curtis_distance_matrix_filename:
    type: string
    default: bray_curtis_distance_matrix.qza
  unweighted_unifrac_pcoa_results_filename:
    type: string
    default: unweighted_unifrac_pcoa_results.qza
  weighted_unifrac_pcoa_results_filename:
    type: string
    default: weighted_unifrac_pcoa_results.qza
  jaccard_pcoa_results_filename:
    type: string
    default: jaccard_pcoa_results.qza
  bray_curtis_pcoa_results_filename:
    type: string
    default: bray_curtis_pcoa_results.qza
  unweighted_unifrac_emperor_filename:
    type: string
    default: unweighted_unifrac_emperor.qzv
  weighted_unifrac_emperor_filename:
    type: string
    default: weighted_unifrac_emperor.qzv
  jaccard_emperor_filename:
    type: string
    default: jaccard_emperor.qzv
  bray_curtis_emperor_filename:
    type: string
    default: bray_curtis_emperor.qzv
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
  rarefied_table:
    type: File
    outputSource: generate_core_metrics/rarefied_table
  faith_pd_vector:
    type: File
    outputSource: generate_core_metrics/faith_pd_vector
  observed_otus_vector:
    type: File
    outputSource: generate_core_metrics/observed_otus_vector
  shannon_vector:
    type: File
    outputSource: generate_core_metrics/shannon_vector
  evenness_vector:
    type: File
    outputSource: generate_core_metrics/evenness_vector
  unweighted_unifrac_distance_matrix:
    type: File
    outputSource: generate_core_metrics/unweighted_unifrac_distance_matrix
  weighted_unifrac_distance_matrix:
    type: File
    outputSource: generate_core_metrics/weighted_unifrac_distance_matrix
  jaccard_distance_matrix:
    type: File
    outputSource: generate_core_metrics/jaccard_distance_matrix
  bray_curtis_distance_matrix:
    type: File
    outputSource: generate_core_metrics/bray_curtis_distance_matrix
  unweighted_unifrac_pcoa_results:
    type: File
    outputSource: generate_core_metrics/unweighted_unifrac_pcoa_results
  weighted_unifrac_pcoa_results:
    type: File
    outputSource: generate_core_metrics/weighted_unifrac_pcoa_results
  jaccard_pcoa_results:
    type: File
    outputSource: generate_core_metrics/jaccard_pcoa_results
  bray_curtis_pcoa_results:
    type: File
    outputSource: generate_core_metrics/bray_curtis_pcoa_results
  unweighted_unifrac_emperor:
    type: File
    outputSource: generate_core_metrics/unweighted_unifrac_emperor
  weighted_unifrac_emperor:
    type: File
    outputSource: generate_core_metrics/weighted_unifrac_emperor
  jaccard_emperor:
    type: File
    outputSource: generate_core_metrics/jaccard_emperor
  bray_curtis_emperor:
    type: File
    outputSource: generate_core_metrics/bray_curtis_emperor

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
      rarefied_table_filename: rarefied_table_filename
      faith_pd_vector_filename: faith_pd_vector_filename
      observed_otus_vector_filename: observed_otus_vector_filename
      shannon_vector_filename: shannon_vector_filename
      evenness_vector_filename: evenness_vector_filename
      unweighted_unifrac_distance_matrix_filename: unweighted_unifrac_distance_matrix_filename
      weighted_unifrac_distance_matrix_filename: weighted_unifrac_distance_matrix_filename
      jaccard_distance_matrix_filename: jaccard_distance_matrix_filename
      bray_curtis_distance_matrix_filename: bray_curtis_distance_matrix_filename
      unweighted_unifrac_pcoa_results_filename: unweighted_unifrac_pcoa_results_filename
      weighted_unifrac_pcoa_results_filename: weighted_unifrac_pcoa_results_filename
      jaccard_pcoa_results_filename: jaccard_pcoa_results_filename
      bray_curtis_pcoa_results_filename: bray_curtis_pcoa_results_filename
      unweighted_unifrac_emperor_filename: unweighted_unifrac_emperor_filename
      weighted_unifrac_emperor_filename: weighted_unifrac_emperor_filename
      jaccard_emperor_filename: jaccard_emperor_filename
      bray_curtis_emperor_filename: bray_curtis_emperor_filename
    out:
      - rarefied_table
      - faith_pd_vector
      - observed_otus_vector
      - shannon_vector
      - evenness_vector
      - unweighted_unifrac_distance_matrix
      - weighted_unifrac_distance_matrix
      - jaccard_distance_matrix
      - bray_curtis_distance_matrix
      - unweighted_unifrac_pcoa_results
      - weighted_unifrac_pcoa_results
      - jaccard_pcoa_results
      - bray_curtis_pcoa_results
      - unweighted_unifrac_emperor
      - weighted_unifrac_emperor
      - jaccard_emperor
      - bray_curtis_emperor
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
      metadata_column: unweighted_unifrac_metadata_column
      output_significance_filename: unweighted_unifrac_significance_filename
    out:
      - out_visual
