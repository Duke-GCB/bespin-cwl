#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
- class: SubworkflowFeatureRequirement
label: qiime2
inputs:
  demux_sequences_artifact: File
  dada2_trim_left: int
  dada2_trunc_len: int
  sample_metadata: File

  dada2_representative_sequences_filename:
    type: string
    default: rep-seqs-dada2.qza
  dada2_table_filename:
    type: string
    default: table-dada2.qza
  dada2_denoising_stats_filename:
    type: string
    default: stats-dada2.qza
  dada2_stats_filename:
    type: string
    default: stats-dada2.qzv
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

outputs:
  dada2_representative_sequences:
    type: File
    outputSource: dada2_denoise_single/representative_sequences
  dada2_table:
    type: File
    outputSource: dada2_denoise_single/table
  dada2_representative_sequences:
    type: File
    outputSource: dada2_denoise_single/representative_sequences
  dada2_visualization_artifact:
    type: File
    outputSource: dada2_visualization/visualization_artifact
  feature_table_summarize_visualization:
    type: File
    outputSource: feature_table_summarize/visualization
  feature_table_tabulation_visualization:
    type: File
    outputSource: feature_table_tabulation/visualization
  aligned_representative_sequences:
    type: File
    outputSource: align_representative_sequences/alignment
  masked_representative_sequences:
    type: File
    outputSource: mask_representative_sequences/masked_aligned_rep_seqs
  unrooted_tree:
    type: File
    outputSource: create_tree_from_alignment/unrooted_tree
  rooted_tree:
    type: File
    outputSource: root_tree/rooted_tree

steps:
  dada2_denoise_single:
    run: ../tools/qiime-dada2-denoise-single.cwl
    in:
      demultiplexed_seqs: demux_sequences_artifact
      trim_left: dada2_trim_left
      trunc_len: dada2_trunc_len
      representative_sequences_filename: dada2_representative_sequences_filename
      table_filename: dada2_table_filename
      denoising_stats_filename: dada2_denoising_stats_filename
    out:
      - representative_sequences
      - table
      - denoising_stats
  dada2_visualization:
    run: ../tools/qiime-metadata-tabulate.cwl
    in:
      input_file: dada2_denoise_single/denoising_stats
      visualization_filename: dada2_stats_filename
    out:
      - visualization_artifact
  feature_table_summarize:
    run: ../tools/qiime-feature-table-summarize.cwl
    in:
      table: dada2_denoise_single/table
      visualization_filename: feature_table_summary_filename
      sample_metadata_file: sample_metadata
    out:
      - visualization
  feature_table_tabulation:
    run: ../tools/qiime-feature-table-tabulate-seqs.cwl
    in:
      data: dada2_denoise_single/representative_sequences
      visualization_filename: feature_table_tabulation_filename
    out:
      - visualization
  align_representative_sequences:
    run: ../tools/qiime-alignment-mafft.cwl
    in:
      sequences: dada2_denoise_single/representative_sequences
      alignment_filename: aligned_rep_seqs_filename
    out:
      - alignment
  mask_representative_sequences:
    run: ../tools/qiime-alignment-mask.cwl
    in:
      alignment: align_representative_sequences/alignment
      masked_aligned_rep_seqs_filename: masked_aligned_rep_seqs_filename
    out:
      - masked_aligned_rep_seqs
  create_tree_from_alignment:
    run: ../tools/qiime-phylogeny-fasttree.cwl
    in:
      alignment: mask_representative_sequences/masked_aligned_rep_seqs
      tree_filename: unrooted_tree_filename
    out:
      - unrooted_tree
  root_tree:
    run: ../tools/qiime-phylogeny-midpoint-root.cwl
    in:
      tree: create_tree_from_alignment/unrooted_tree
      rooted_tree_filename: rooted_tree_filename
    out:
      - rooted_tree
