#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: QIIME2 Step 2 (DADA2 option)
doc: |
  QIIME2 DADA2, feature summaries, phylogenetic diversity tree, taxonomic analysis and ancom


inputs:
  demux_sequences_artifact: File
  dada2_trim_left: int
  dada2_trunc_len: int
  sample_metadata: File
  taxonomic_classifier: File
  ancom_collapse_level: int
  ancom_filter_sample_query: string

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
  dada2_sequences:
    run: ../subworkflows/qiime2-03-dada2.cwl
    in:
      demux_sequences_artifact: demux_sequences_artifact
      dada2_trim_left: dada2_trim_left
      dada2_trunc_len: dada2_trunc_len
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
    out:
      - feature_table_summarize_visualization
      - feature_table_tabulation_visualization
  phylogenetic_tree:
    run: ../subworkflows/qiime2-05-phylogeny.cwl
    in:
      representative_sequences: dada2_sequences/dada2_representative_sequences
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
    out:
      - taxonomy_artifact
      - taxonomy_visualization_file
      - taxa_barplot_file
  ancom_diff_abundance:
    run: ../subworkflows/qiime2-09-ancom.cwl
    in:
      table: dada2_sequences/dada2_table
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
