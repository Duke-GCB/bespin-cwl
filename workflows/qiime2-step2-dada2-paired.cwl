#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
- class: StepInputExpressionRequirement
- class: InlineJavascriptRequirement
- class: MultipleInputFeatureRequirement

label: QIIME2 Step 2 (DADA2 option)
doc: |
  QIIME2 DADA2, feature summaries, phylogenetic diversity tree, taxonomic analysis and ancom

inputs:
  demux_sequences_artifact: File
  dada2_trunc_len_f: int
  dada2_trunc_len_r: int
  dada2_trim_left_f: int
  dada2_trim_left_r: int
  dada2_denoise_n_threads: int
  sample_metadata: File
  taxonomic_classifier: File
  filter_feature_table_where: string
  dada2_representative_sequences_filename:
    type: string
    default: rep-seqs.qza
  dada2_table_filename:
    type: string
    default: table.qza
  dada2_denoising_stats_filename:
    type: string
    default: stats.qza
  dada2_stats_filename:
    type: string
    default: stats.qzv
  filtered_table_filename_filename:
    type: string
    default: filtered-table.qza
  feature_table_summary_filename:
    type: string
    default: table.qzv
  feature_table_tabulation_filename:
    type: string
    default: rep-seqs.qzv
  aligned_rep_seqs_filename:
    type: string
    default: aligned-rep-seqs.qza
  masked_aligned_rep_seqs_filename:
    type: string
    default: masked-aligned-rep-seqs.qza
  unrooted_tree_filename:
    type: string
    default: unrooted-tree.qza
  rooted_tree_filename:
    type: string
    default: rooted-tree.qza
  taxonomy_filename:
    type: string
    default: taxonomy.qza
  taxonomy_visualization_filename:
    type: string
    default: taxonomy.qzv
  taxa_bar_plots_filename:
    type: string
    default: taxa-bar-plots.qzv
  output_filename_prefix:
    type: string
    default: ''

outputs:
   dada2_representative_sequences:
     type: File
     outputSource: dada2_sequences/dada2_representative_sequences
   dada2_table:
     type: File
     outputSource: dada2_sequences/dada2_table
   dada2_denoising_stats:
     type: File
     outputSource: dada2_sequences/dada2_denoising_stats
   dada2_visualization_artifact:
     type: File
     outputSource: dada2_sequences/dada2_visualization_artifact

   filtered_feature_table_artifact:
     type: File
     outputSource: feature_table_visualizations/filtered_feature_table_artifact
   feature_table_summarize_visualization:
     type: File
     outputSource: feature_table_visualizations/feature_table_summarize_visualization
   feature_table_tabulation_visualization:
     type: File
     outputSource: feature_table_visualizations/feature_table_tabulation_visualization

   aligned_representative_sequences:
     type: File
     outputSource: phylogenetic_tree/aligned_representative_sequences
   masked_representative_sequences:
     type: File
     outputSource: phylogenetic_tree/masked_representative_sequences
   unrooted_tree:
     type: File
     outputSource: phylogenetic_tree/unrooted_tree
   rooted_tree:
     type: File
     outputSource: phylogenetic_tree/rooted_tree

   taxonomy_artifact:
     type: File
     outputSource: taxonomic_analysis/taxonomy_artifact
   taxonomy_visualization_file:
     type: File
     outputSource: taxonomic_analysis/taxonomy_visualization_file
   taxa_barplot_file:
     type: File
     outputSource: taxonomic_analysis/taxa_barplot_file

   qza_directory:
     type: Directory
     outputSource: create_output_directories/qza_directory
   qzv_directory:
     type: Directory
     outputSource: create_output_directories/qzv_directory

steps:
  dada2_sequences:
    run: ../subworkflows/qiime2-03-dada2-paired.cwl
    in:
      demux_sequences_artifact: demux_sequences_artifact
      trunc_len_f: dada2_trunc_len_f
      trunc_len_r: dada2_trunc_len_r
      trim_left_f: dada2_trim_left_f
      trim_left_r: dada2_trim_left_r
      n_threads: dada2_denoise_n_threads
      dada2_representative_sequences_filename:
        source:
          - output_filename_prefix
          - dada2_representative_sequences_filename
        valueFrom: ${ return self[0] + self[1]; }
      dada2_table_filename:
        source:
          - output_filename_prefix
          - dada2_table_filename
        valueFrom: ${ return self[0] + self[1]; }
      dada2_denoising_stats_filename:
        source:
          - output_filename_prefix
          - dada2_denoising_stats_filename
        valueFrom: ${ return self[0] + self[1]; }
      dada2_stats_filename:
        source:
          - output_filename_prefix
          - dada2_stats_filename
        valueFrom: ${ return self[0] + self[1]; }
    out:
      - dada2_representative_sequences
      - dada2_table
      - dada2_denoising_stats
      - dada2_visualization_artifact
  feature_table_visualizations:
    run: ../subworkflows/qiime2-04-features.cwl
    in:
      feature_table_artifact: dada2_sequences/dada2_table
      rep_seqs_artifact: dada2_sequences/dada2_representative_sequences
      sample_metadata: sample_metadata
      filter_feature_table_where: filter_feature_table_where
      filtered_table_filename_filename:
        source:
          - output_filename_prefix
          - filtered_table_filename_filename
        valueFrom: ${ return self[0] + self[1]; }
      feature_table_summary_filename:
        source:
          - output_filename_prefix
          - feature_table_summary_filename
        valueFrom: ${ return self[0] + self[1]; }
      feature_table_tabulation_filename:
        source:
          - output_filename_prefix
          - feature_table_tabulation_filename
        valueFrom: ${ return self[0] + self[1]; }
    out:
      - filtered_feature_table_artifact
      - feature_table_summarize_visualization
      - feature_table_tabulation_visualization
  phylogenetic_tree:
    run: ../subworkflows/qiime2-05-phylogeny.cwl
    in:
      representative_sequences: dada2_sequences/dada2_representative_sequences
      aligned_rep_seqs_filename:
        source:
          - output_filename_prefix
          - aligned_rep_seqs_filename
        valueFrom: ${ return self[0] + self[1]; }
      masked_aligned_rep_seqs_filename:
        source:
          - output_filename_prefix
          - masked_aligned_rep_seqs_filename
        valueFrom: ${ return self[0] + self[1]; }
      unrooted_tree_filename:
        source:
          - output_filename_prefix
          - unrooted_tree_filename
        valueFrom: ${ return self[0] + self[1]; }
      rooted_tree_filename:
        source:
          - output_filename_prefix
          - rooted_tree_filename
        valueFrom: ${ return self[0] + self[1]; }
    out:
      - aligned_representative_sequences
      - masked_representative_sequences
      - unrooted_tree
      - rooted_tree
  taxonomic_analysis:
    run: ../subworkflows/qiime2-08-taxonomic-analysis.cwl
    in:
      rep_seqs: dada2_sequences/dada2_representative_sequences
      table: dada2_sequences/dada2_table
      classifier: taxonomic_classifier
      sample_metadata: sample_metadata
      taxonomy_filename:
        source:
          - output_filename_prefix
          - taxonomy_filename
        valueFrom: ${ return self[0] + self[1]; }
      taxonomy_visualization_filename:
        source:
          - output_filename_prefix
          - taxonomy_visualization_filename
        valueFrom: ${ return self[0] + self[1]; }
      taxa_bar_plots_filename:
        source:
          - output_filename_prefix
          - taxa_bar_plots_filename
        valueFrom: ${ return self[0] + self[1]; }
    out:
      - taxonomy_artifact
      - taxonomy_visualization_file
      - taxa_barplot_file
  create_output_directories:
    run: ../subworkflows/qiime2-output-directories.cwl
    in:
      qza_files:
        source:
          - dada2_sequences/dada2_representative_sequences
          - dada2_sequences/dada2_table
          - dada2_sequences/dada2_denoising_stats
          - feature_table_visualizations/filtered_feature_table_artifact
          - phylogenetic_tree/aligned_representative_sequences
          - phylogenetic_tree/masked_representative_sequences
          - phylogenetic_tree/unrooted_tree
          - phylogenetic_tree/rooted_tree
          - taxonomic_analysis/taxonomy_artifact
        valueFrom: ${ return [].slice.call(self); }
      qzv_files:
        source:
          - dada2_sequences/dada2_visualization_artifact
          - feature_table_visualizations/feature_table_summarize_visualization
          - feature_table_visualizations/feature_table_tabulation_visualization
          - taxonomic_analysis/taxonomy_visualization_file
          - taxonomic_analysis/taxa_barplot_file
        valueFrom: ${ return [].slice.call(self); }
    out:
      - qza_directory
      - qzv_directory
