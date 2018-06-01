#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: QIIME2 Step 2 (Deblur option)
doc: |
  QIIME2 Deblur, feature summaries, phylogenetic diversity tree, taxonomic analysis and ancom

inputs:
  demux_sequences_artifact: File
  deblur_trim_length: int
  sample_metadata: File
  taxonomic_classifier: File
  ancom_collapse_level: int
  ancom_filter_sample_query: string

outputs:
   deblur_filtered_sequences:
     type: File
     outputSource: deblur_sequences/filtered_sequences
   deblur_filter_stats:
     type: File
     outputSource: deblur_sequences/filter_stats
   deblur_rep_seqs:
     type: File
     outputSource: deblur_sequences/rep_seqs
   deblur_table:
     type: File
     outputSource: deblur_sequences/table
   deblur_stats:
     type: File
     outputSource: deblur_sequences/stats
   deblur_demux_filter_stats:
     type: File
     outputSource: deblur_sequences/demux_filter_stats
   deblur_stats_visualization:
     type: File
     outputSource: deblur_sequences/stats_visualization

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

   filter_table_file:
     type: File
     outputSource: ancom_diff_abundance/filter_table_file
   composition_table_file:
     type: File
     outputSource: ancom_diff_abundance/composition_table_file
   ancom_visualization_file:
     type: File
     outputSource: ancom_diff_abundance/ancom_visualization_file
   collapsed_table_file:
     type: File
     outputSource: ancom_diff_abundance/collapsed_table_file
   comp_gut_table_l6_file:
     type: File
     outputSource: ancom_diff_abundance/comp_gut_table_l6_file
   ancom_subject_16_visualization_file:
     type: File
     outputSource: ancom_diff_abundance/ancom_subject_16_visualization_file

steps:
  deblur_sequences:
    run: ../subworkflows/qiime2-03-deblur.cwl
    in:
      demux_sequences_artifact: demux_sequences_artifact
      trim_length: deblur_trim_length
    out:
      - filtered_sequences
      - filter_stats
      - rep_seqs
      - table
      - stats
      - demux_filter_stats
      - stats_visualization
  feature_table_visualizations:
    run: ../subworkflows/qiime2-04-features.cwl
    in:
      feature_table_artifact: deblur_sequences/table
      rep_seqs_artifact: deblur_sequences/rep_seqs
      sample_metadata: sample_metadata
    out:
      - feature_table_summarize_visualization
      - feature_table_tabulation_visualization
  phylogenetic_tree:
    run: ../subworkflows/qiime2-05-phylogeny.cwl
    in:
      representative_sequences: deblur_sequences/rep_seqs
    out:
      - aligned_representative_sequences
      - masked_representative_sequences
      - unrooted_tree
      - rooted_tree
  taxonomic_analysis:
    run: ../subworkflows/qiime2-08-taxonomic-analysis.cwl
    in:
      rep_seqs: deblur_sequences/rep_seqs
      table: deblur_sequences/table
      classifier: taxonomic_classifier
      sample_metadata: sample_metadata
    out:
      - taxonomy_artifact
      - taxonomy_visualization_file
      - taxa_barplot_file
  ancom_diff_abundance:
    run: ../subworkflows/qiime2-09-ancom.cwl
    in:
      table: deblur_sequences/table
      sample_metadata: sample_metadata
      collapse_level: ancom_collapse_level
      taxonomy: taxonomic_analysis/taxonomy_artifact
      filter_sample_query: ancom_filter_sample_query
    out:
      - filter_table_file
      - composition_table_file
      - ancom_visualization_file
      - collapsed_table_file
      - comp_gut_table_l6_file
      - ancom_subject_16_visualization_file
