#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
- class: StepInputExpressionRequirement
- class: InlineJavascriptRequirement
- class: MultipleInputFeatureRequirement
label: QIIME2 Step 3
doc: |
  QIIME2 Alpha/beta diversity analysis and Alpha rarefaction plotting

inputs:
  rooted_tree: File
  table: File
  sample_metadata: File
  diversity_sampling_depth: int
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
  output_filename_prefix:
    type: string
    default: ''
outputs:
  rarefied_table:
    type: File
    outputSource: alpha_beta_diversity/rarefied_table
  faith_pd_vector:
    type: File
    outputSource: alpha_beta_diversity/faith_pd_vector
  observed_otus_vector:
    type: File
    outputSource: alpha_beta_diversity/observed_otus_vector
  shannon_vector:
    type: File
    outputSource: alpha_beta_diversity/shannon_vector
  evenness_vector:
    type: File
    outputSource: alpha_beta_diversity/evenness_vector
  unweighted_unifrac_distance_matrix:
    type: File
    outputSource: alpha_beta_diversity/unweighted_unifrac_distance_matrix
  weighted_unifrac_distance_matrix:
    type: File
    outputSource: alpha_beta_diversity/weighted_unifrac_distance_matrix
  jaccard_distance_matrix:
    type: File
    outputSource: alpha_beta_diversity/jaccard_distance_matrix
  bray_curtis_distance_matrix:
    type: File
    outputSource: alpha_beta_diversity/bray_curtis_distance_matrix
  unweighted_unifrac_pcoa_results:
    type: File
    outputSource: alpha_beta_diversity/unweighted_unifrac_pcoa_results
  weighted_unifrac_pcoa_results:
    type: File
    outputSource: alpha_beta_diversity/weighted_unifrac_pcoa_results
  jaccard_pcoa_results:
    type: File
    outputSource: alpha_beta_diversity/jaccard_pcoa_results
  bray_curtis_pcoa_results:
    type: File
    outputSource: alpha_beta_diversity/bray_curtis_pcoa_results
  unweighted_unifrac_emperor:
    type: File
    outputSource: alpha_beta_diversity/unweighted_unifrac_emperor
  weighted_unifrac_emperor:
    type: File
    outputSource: alpha_beta_diversity/weighted_unifrac_emperor
  jaccard_emperor:
    type: File
    outputSource: alpha_beta_diversity/jaccard_emperor
  bray_curtis_emperor:
    type: File
    outputSource: alpha_beta_diversity/bray_curtis_emperor
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

  qza_directory:
     type: Directory
     outputSource: create_output_directories/qza_directory
  qzv_directory:
     type: Directory
     outputSource: create_output_directories/qzv_directory
steps:
  alpha_beta_diversity:
    run: ../subworkflows/qiime2-paired-alpha-beta-diversity.cwl
    in:
      rooted_tree: rooted_tree
      table: table
      sampling_depth: diversity_sampling_depth
      sample_metadata: sample_metadata
      unweighted_unifrac_metadata_column: unweighted_unifrac_metadata_column
      rarefied_table_filename:
        source:
          - output_filename_prefix
          - rarefied_table_filename
        valueFrom: ${ return self[0] + self[1]; }
      faith_pd_vector_filename:
        source:
          - output_filename_prefix
          - faith_pd_vector_filename
        valueFrom: ${ return self[0] + self[1]; }
      observed_otus_vector_filename:
        source:
          - output_filename_prefix
          - observed_otus_vector_filename
        valueFrom: ${ return self[0] + self[1]; }
      shannon_vector_filename:
        source:
          - output_filename_prefix
          - shannon_vector_filename
        valueFrom: ${ return self[0] + self[1]; }
      evenness_vector_filename:
        source:
          - output_filename_prefix
          - evenness_vector_filename
        valueFrom: ${ return self[0] + self[1]; }
      unweighted_unifrac_distance_matrix_filename:
        source:
          - output_filename_prefix
          - unweighted_unifrac_distance_matrix_filename
        valueFrom: ${ return self[0] + self[1]; }
      weighted_unifrac_distance_matrix_filename:
        source:
          - output_filename_prefix
          - weighted_unifrac_distance_matrix_filename
        valueFrom: ${ return self[0] + self[1]; }
      jaccard_distance_matrix_filename:
        source:
          - output_filename_prefix
          - jaccard_distance_matrix_filename
        valueFrom: ${ return self[0] + self[1]; }
      bray_curtis_distance_matrix_filename:
        source:
          - output_filename_prefix
          - bray_curtis_distance_matrix_filename
        valueFrom: ${ return self[0] + self[1]; }
      unweighted_unifrac_pcoa_results_filename:
        source:
          - output_filename_prefix
          - unweighted_unifrac_pcoa_results_filename
        valueFrom: ${ return self[0] + self[1]; }
      weighted_unifrac_pcoa_results_filename:
        source:
          - output_filename_prefix
          - weighted_unifrac_pcoa_results_filename
        valueFrom: ${ return self[0] + self[1]; }
      jaccard_pcoa_results_filename:
        source:
          - output_filename_prefix
          - jaccard_pcoa_results_filename
        valueFrom: ${ return self[0] + self[1]; }
      bray_curtis_pcoa_results_filename:
        source:
          - output_filename_prefix
          - bray_curtis_pcoa_results_filename
        valueFrom: ${ return self[0] + self[1]; }
      unweighted_unifrac_emperor_filename:
        source:
          - output_filename_prefix
          - unweighted_unifrac_emperor_filename
        valueFrom: ${ return self[0] + self[1]; }
      weighted_unifrac_emperor_filename:
        source:
          - output_filename_prefix
          - weighted_unifrac_emperor_filename
        valueFrom: ${ return self[0] + self[1]; }
      jaccard_emperor_filename:
        source:
          - output_filename_prefix
          - jaccard_emperor_filename
        valueFrom: ${ return self[0] + self[1]; }
      bray_curtis_emperor_filename:
        source:
          - output_filename_prefix
          - bray_curtis_emperor_filename
        valueFrom: ${ return self[0] + self[1]; }
      faith_pd_group_significance_filename:
        source:
          - output_filename_prefix
          - faith_pd_group_significance_filename
        valueFrom: ${ return self[0] + self[1]; }
      evenness_group_significance_filename:
        source:
          - output_filename_prefix
          - evenness_group_significance_filename
        valueFrom: ${ return self[0] + self[1]; }
      shannon_group_significance_filename:
        source:
          - output_filename_prefix
          - shannon_group_significance_filename
        valueFrom: ${ return self[0] + self[1]; }
      unweighted_unifrac_body_site_significance_filename:
        source:
          - output_filename_prefix
          - unweighted_unifrac_body_site_significance_filename
        valueFrom: ${ return self[0] + self[1]; }
      unweighted_unifrac_significance_filename:
        source:
          - output_filename_prefix
          - unweighted_unifrac_significance_filename
        valueFrom: ${ return self[0] + self[1]; }
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
     - faith_pd_group_significance_file
     - evenness_group_significance_file
     - shannon_group_significance_file
     - unweighted_unifrac_significance_file

  create_output_directories:
    run: ../subworkflows/qiime2-output-directories.cwl
    in:
      qza_files:
        source:
          - alpha_beta_diversity/rarefied_table
          - alpha_beta_diversity/faith_pd_vector
          - alpha_beta_diversity/observed_otus_vector
          - alpha_beta_diversity/shannon_vector
          - alpha_beta_diversity/evenness_vector
          - alpha_beta_diversity/unweighted_unifrac_distance_matrix
          - alpha_beta_diversity/weighted_unifrac_distance_matrix
          - alpha_beta_diversity/jaccard_distance_matrix
          - alpha_beta_diversity/bray_curtis_distance_matrix
          - alpha_beta_diversity/unweighted_unifrac_pcoa_results
          - alpha_beta_diversity/weighted_unifrac_pcoa_results
          - alpha_beta_diversity/jaccard_pcoa_results
          - alpha_beta_diversity/bray_curtis_pcoa_results
        valueFrom: ${ return [].slice.call(self); }
      qzv_files:
        source:
          - alpha_beta_diversity/unweighted_unifrac_emperor
          - alpha_beta_diversity/weighted_unifrac_emperor
          - alpha_beta_diversity/jaccard_emperor
          - alpha_beta_diversity/bray_curtis_emperor
          - alpha_beta_diversity/faith_pd_group_significance_file
          - alpha_beta_diversity/evenness_group_significance_file
          - alpha_beta_diversity/shannon_group_significance_file
          - alpha_beta_diversity/unweighted_unifrac_significance_file
        valueFrom: ${ return [].slice.call(self); }
    out:
      - qza_directory
      - qzv_directory
