{
    "cwlVersion": "v1.0", 
    "$graph": [
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "qiime2 Deblur detect/correct sequence data", 
            "doc": "Option 2: Deblur from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "string", 
                    "default": "demux-filter-stats.qzv", 
                    "id": "#qiime2-03-deblur.cwl/demux_filter_visualization_filename"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-03-deblur.cwl/demux_sequences_artifact"
                }, 
                {
                    "type": "int", 
                    "id": "#qiime2-03-deblur.cwl/trim_length"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-deblur.cwl/deblur_metadata_tabulate/visualization_artifact", 
                    "id": "#qiime2-03-deblur.cwl/demux_filter_stats"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-deblur.cwl/deblur_quality_filter/filter_stats", 
                    "id": "#qiime2-03-deblur.cwl/filter_stats"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-deblur.cwl/deblur_quality_filter/filtered_sequences", 
                    "id": "#qiime2-03-deblur.cwl/filtered_sequences"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-deblur.cwl/deblur_denoise/representative_sequences", 
                    "id": "#qiime2-03-deblur.cwl/rep_seqs"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-deblur.cwl/deblur_denoise/stats", 
                    "id": "#qiime2-03-deblur.cwl/stats"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-deblur.cwl/deblur_visualize/deblur_stats", 
                    "id": "#qiime2-03-deblur.cwl/stats_visualization"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-deblur.cwl/deblur_denoise/table", 
                    "id": "#qiime2-03-deblur.cwl/table"
                }
            ], 
            "steps": [
                {
                    "run": "#deblur-denoise-16S.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-03-deblur.cwl/demux_sequences_artifact", 
                            "id": "#qiime2-03-deblur.cwl/deblur_denoise/demultiplexed_seqs"
                        }, 
                        {
                            "source": "#qiime2-03-deblur.cwl/trim_length", 
                            "id": "#qiime2-03-deblur.cwl/deblur_denoise/trim_length"
                        }
                    ], 
                    "out": [
                        "#qiime2-03-deblur.cwl/deblur_denoise/representative_sequences", 
                        "#qiime2-03-deblur.cwl/deblur_denoise/table", 
                        "#qiime2-03-deblur.cwl/deblur_denoise/stats"
                    ], 
                    "id": "#qiime2-03-deblur.cwl/deblur_denoise"
                }, 
                {
                    "run": "#metadata-tabulate.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-03-deblur.cwl/deblur_quality_filter/filter_stats", 
                            "id": "#qiime2-03-deblur.cwl/deblur_metadata_tabulate/input_file"
                        }, 
                        {
                            "source": "#qiime2-03-deblur.cwl/demux_filter_visualization_filename", 
                            "id": "#qiime2-03-deblur.cwl/deblur_metadata_tabulate/visualization_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-03-deblur.cwl/deblur_metadata_tabulate/visualization_artifact"
                    ], 
                    "id": "#qiime2-03-deblur.cwl/deblur_metadata_tabulate"
                }, 
                {
                    "run": "#quality-filter-q-score.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-03-deblur.cwl/demux_sequences_artifact", 
                            "id": "#qiime2-03-deblur.cwl/deblur_quality_filter/demux"
                        }
                    ], 
                    "out": [
                        "#qiime2-03-deblur.cwl/deblur_quality_filter/filtered_sequences", 
                        "#qiime2-03-deblur.cwl/deblur_quality_filter/filter_stats"
                    ], 
                    "id": "#qiime2-03-deblur.cwl/deblur_quality_filter"
                }, 
                {
                    "run": "#deblur-visualize-stats.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-03-deblur.cwl/deblur_denoise/stats", 
                            "id": "#qiime2-03-deblur.cwl/deblur_visualize/input_file"
                        }
                    ], 
                    "out": [
                        "#qiime2-03-deblur.cwl/deblur_visualize/deblur_stats"
                    ], 
                    "id": "#qiime2-03-deblur.cwl/deblur_visualize"
                }
            ], 
            "id": "#qiime2-03-deblur.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "qiime2 create feature visual summaries", 
            "doc": "FeatureTable and FeatureData summaries from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "File", 
                    "id": "#qiime2-04-features.cwl/feature_table_artifact"
                }, 
                {
                    "type": "string", 
                    "default": "table.qzv", 
                    "id": "#qiime2-04-features.cwl/feature_table_summary_filename"
                }, 
                {
                    "type": "string", 
                    "default": "rep-seqs.qzv", 
                    "id": "#qiime2-04-features.cwl/feature_table_tabulation_filename"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-04-features.cwl/rep_seqs_artifact"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-04-features.cwl/sample_metadata"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-04-features.cwl/feature_table_summarize/visualization", 
                    "id": "#qiime2-04-features.cwl/feature_table_summarize_visualization"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-04-features.cwl/feature_table_tabulation/visualization", 
                    "id": "#qiime2-04-features.cwl/feature_table_tabulation_visualization"
                }
            ], 
            "steps": [
                {
                    "run": "#feature-table-summarize.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-04-features.cwl/sample_metadata", 
                            "id": "#qiime2-04-features.cwl/feature_table_summarize/sample_metadata_file"
                        }, 
                        {
                            "source": "#qiime2-04-features.cwl/feature_table_artifact", 
                            "id": "#qiime2-04-features.cwl/feature_table_summarize/table"
                        }, 
                        {
                            "source": "#qiime2-04-features.cwl/feature_table_summary_filename", 
                            "id": "#qiime2-04-features.cwl/feature_table_summarize/visualization_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-04-features.cwl/feature_table_summarize/visualization"
                    ], 
                    "id": "#qiime2-04-features.cwl/feature_table_summarize"
                }, 
                {
                    "run": "#feature-table-tabulate-seqs.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-04-features.cwl/rep_seqs_artifact", 
                            "id": "#qiime2-04-features.cwl/feature_table_tabulation/data"
                        }, 
                        {
                            "source": "#qiime2-04-features.cwl/feature_table_tabulation_filename", 
                            "id": "#qiime2-04-features.cwl/feature_table_tabulation/visualization_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-04-features.cwl/feature_table_tabulation/visualization"
                    ], 
                    "id": "#qiime2-04-features.cwl/feature_table_tabulation"
                }
            ], 
            "id": "#qiime2-04-features.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "qiime2 create phylogenetic tree", 
            "doc": "Generate a tree for phylogenetic diversity analyses from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "string", 
                    "default": "aligned-rep-seqs.qza", 
                    "id": "#qiime2-05-phylogeny.cwl/aligned_rep_seqs_filename"
                }, 
                {
                    "type": "string", 
                    "default": "masked-aligned-rep-seqs.qza", 
                    "id": "#qiime2-05-phylogeny.cwl/masked_aligned_rep_seqs_filename"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-05-phylogeny.cwl/representative_sequences"
                }, 
                {
                    "type": "string", 
                    "default": "rooted-tree.qza", 
                    "id": "#qiime2-05-phylogeny.cwl/rooted_tree_filename"
                }, 
                {
                    "type": "string", 
                    "default": "unrooted-tree.qza", 
                    "id": "#qiime2-05-phylogeny.cwl/unrooted_tree_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-05-phylogeny.cwl/align_representative_sequences/alignment", 
                    "id": "#qiime2-05-phylogeny.cwl/aligned_representative_sequences"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-05-phylogeny.cwl/mask_representative_sequences/masked_aligned_rep_seqs", 
                    "id": "#qiime2-05-phylogeny.cwl/masked_representative_sequences"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-05-phylogeny.cwl/root_tree/rooted_tree", 
                    "id": "#qiime2-05-phylogeny.cwl/rooted_tree"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-05-phylogeny.cwl/create_tree_from_alignment/unrooted_tree", 
                    "id": "#qiime2-05-phylogeny.cwl/unrooted_tree"
                }
            ], 
            "steps": [
                {
                    "run": "#alignment-mafft.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-05-phylogeny.cwl/aligned_rep_seqs_filename", 
                            "id": "#qiime2-05-phylogeny.cwl/align_representative_sequences/alignment_filename"
                        }, 
                        {
                            "source": "#qiime2-05-phylogeny.cwl/representative_sequences", 
                            "id": "#qiime2-05-phylogeny.cwl/align_representative_sequences/sequences"
                        }
                    ], 
                    "out": [
                        "#qiime2-05-phylogeny.cwl/align_representative_sequences/alignment"
                    ], 
                    "id": "#qiime2-05-phylogeny.cwl/align_representative_sequences"
                }, 
                {
                    "run": "#phylogeny-fasttree.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-05-phylogeny.cwl/mask_representative_sequences/masked_aligned_rep_seqs", 
                            "id": "#qiime2-05-phylogeny.cwl/create_tree_from_alignment/alignment"
                        }, 
                        {
                            "source": "#qiime2-05-phylogeny.cwl/unrooted_tree_filename", 
                            "id": "#qiime2-05-phylogeny.cwl/create_tree_from_alignment/tree_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-05-phylogeny.cwl/create_tree_from_alignment/unrooted_tree"
                    ], 
                    "id": "#qiime2-05-phylogeny.cwl/create_tree_from_alignment"
                }, 
                {
                    "run": "#alignment-mask.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-05-phylogeny.cwl/align_representative_sequences/alignment", 
                            "id": "#qiime2-05-phylogeny.cwl/mask_representative_sequences/alignment"
                        }, 
                        {
                            "source": "#qiime2-05-phylogeny.cwl/masked_aligned_rep_seqs_filename", 
                            "id": "#qiime2-05-phylogeny.cwl/mask_representative_sequences/masked_aligned_rep_seqs_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-05-phylogeny.cwl/mask_representative_sequences/masked_aligned_rep_seqs"
                    ], 
                    "id": "#qiime2-05-phylogeny.cwl/mask_representative_sequences"
                }, 
                {
                    "run": "#phylogeny-midpoint-root.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-05-phylogeny.cwl/rooted_tree_filename", 
                            "id": "#qiime2-05-phylogeny.cwl/root_tree/rooted_tree_filename"
                        }, 
                        {
                            "source": "#qiime2-05-phylogeny.cwl/create_tree_from_alignment/unrooted_tree", 
                            "id": "#qiime2-05-phylogeny.cwl/root_tree/tree"
                        }
                    ], 
                    "out": [
                        "#qiime2-05-phylogeny.cwl/root_tree/rooted_tree"
                    ], 
                    "id": "#qiime2-05-phylogeny.cwl/root_tree"
                }
            ], 
            "id": "#qiime2-05-phylogeny.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }, 
                {
                    "class": "StepInputExpressionRequirement"
                }
            ], 
            "label": "qiime2 explore sample taxonomic composition", 
            "doc": "Taxonomic analysis from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "File", 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/classifier"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/rep_seqs"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/table"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-08-taxonomic-analysis.cwl/taxa_barplot/taxa_bar_plots", 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/taxa_barplot_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-08-taxonomic-analysis.cwl/classify_features/out_taxa", 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/taxonomy_artifact"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-08-taxonomic-analysis.cwl/tabulate_metadata/visualization_artifact", 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/taxonomy_visualization_file"
                }
            ], 
            "steps": [
                {
                    "run": "#feature-classifier-classify-sklearn.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-08-taxonomic-analysis.cwl/classifier", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/classify_features/classifier"
                        }, 
                        {
                            "source": "#qiime2-08-taxonomic-analysis.cwl/rep_seqs", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/classify_features/rep_seqs"
                        }, 
                        {
                            "valueFrom": "taxonomy.qza", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/classify_features/taxonomy_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-08-taxonomic-analysis.cwl/classify_features/out_taxa"
                    ], 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/classify_features"
                }, 
                {
                    "run": "#metadata-tabulate.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-08-taxonomic-analysis.cwl/classify_features/out_taxa", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/tabulate_metadata/input_file"
                        }, 
                        {
                            "valueFrom": "taxonomy.qzv", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/tabulate_metadata/visualization_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-08-taxonomic-analysis.cwl/tabulate_metadata/visualization_artifact"
                    ], 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/tabulate_metadata"
                }, 
                {
                    "run": "#taxa-barplot.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-08-taxonomic-analysis.cwl/sample_metadata", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/taxa_barplot/sample_metadata"
                        }, 
                        {
                            "source": "#qiime2-08-taxonomic-analysis.cwl/table", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/taxa_barplot/table"
                        }, 
                        {
                            "valueFrom": "taxa-bar-plots.qzv", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/taxa_barplot/taxa_bar_plots_filename"
                        }, 
                        {
                            "source": "#qiime2-08-taxonomic-analysis.cwl/classify_features/out_taxa", 
                            "id": "#qiime2-08-taxonomic-analysis.cwl/taxa_barplot/taxonomy"
                        }
                    ], 
                    "out": [
                        "#qiime2-08-taxonomic-analysis.cwl/taxa_barplot/taxa_bar_plots"
                    ], 
                    "id": "#qiime2-08-taxonomic-analysis.cwl/taxa_barplot"
                }
            ], 
            "id": "#qiime2-08-taxonomic-analysis.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }, 
                {
                    "class": "StepInputExpressionRequirement"
                }
            ], 
            "label": "qiime2 identify differentially abundant features", 
            "doc": "Differential abundance testing with ANCOM from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "int", 
                    "id": "#qiime2-09-ancom.cwl/collapse_level"
                }, 
                {
                    "type": "string", 
                    "id": "#qiime2-09-ancom.cwl/filter_sample_query"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-09-ancom.cwl/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-09-ancom.cwl/table"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-09-ancom.cwl/taxonomy"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-09-ancom.cwl/ancom_subject_16/out_visual", 
                    "id": "#qiime2-09-ancom.cwl/ancom_subject_16_visualization_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-09-ancom.cwl/ancom_subject_column_gut_table/out_visual", 
                    "id": "#qiime2-09-ancom.cwl/ancom_visualization_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-09-ancom.cwl/gut_table_collapse/out_collapsed_table", 
                    "id": "#qiime2-09-ancom.cwl/collapsed_table_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-09-ancom.cwl/comp_gut_table_l6/out_comp_table", 
                    "id": "#qiime2-09-ancom.cwl/comp_gut_table_l6_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-09-ancom.cwl/pseudocount_gut_table/out_comp_table", 
                    "id": "#qiime2-09-ancom.cwl/composition_table_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-09-ancom.cwl/filter_gut_samples/filtered_table", 
                    "id": "#qiime2-09-ancom.cwl/filter_table_file"
                }
            ], 
            "steps": [
                {
                    "run": "#composition-ancom.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-09-ancom.cwl/comp_gut_table_l6/out_comp_table", 
                            "id": "#qiime2-09-ancom.cwl/ancom_subject_16/comp_table"
                        }, 
                        {
                            "valueFrom": "l6-ancom-Subject.qzv", 
                            "id": "#qiime2-09-ancom.cwl/ancom_subject_16/feat_visualization"
                        }, 
                        {
                            "valueFrom": "Subject", 
                            "id": "#qiime2-09-ancom.cwl/ancom_subject_16/metadata_column"
                        }, 
                        {
                            "source": "#qiime2-09-ancom.cwl/sample_metadata", 
                            "id": "#qiime2-09-ancom.cwl/ancom_subject_16/metadata_file"
                        }
                    ], 
                    "out": [
                        "#qiime2-09-ancom.cwl/ancom_subject_16/out_visual"
                    ], 
                    "id": "#qiime2-09-ancom.cwl/ancom_subject_16"
                }, 
                {
                    "run": "#composition-ancom.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-09-ancom.cwl/pseudocount_gut_table/out_comp_table", 
                            "id": "#qiime2-09-ancom.cwl/ancom_subject_column_gut_table/comp_table"
                        }, 
                        {
                            "valueFrom": "ancom.qzv", 
                            "id": "#qiime2-09-ancom.cwl/ancom_subject_column_gut_table/feat_visualization"
                        }, 
                        {
                            "valueFrom": "Subject", 
                            "id": "#qiime2-09-ancom.cwl/ancom_subject_column_gut_table/metadata_column"
                        }, 
                        {
                            "source": "#qiime2-09-ancom.cwl/sample_metadata", 
                            "id": "#qiime2-09-ancom.cwl/ancom_subject_column_gut_table/metadata_file"
                        }
                    ], 
                    "out": [
                        "#qiime2-09-ancom.cwl/ancom_subject_column_gut_table/out_visual"
                    ], 
                    "id": "#qiime2-09-ancom.cwl/ancom_subject_column_gut_table"
                }, 
                {
                    "run": "#composition-add-pseudocount.cwl", 
                    "in": [
                        {
                            "valueFrom": "comp-gut-table-l6.qza", 
                            "id": "#qiime2-09-ancom.cwl/comp_gut_table_l6/composition"
                        }, 
                        {
                            "source": "#qiime2-09-ancom.cwl/gut_table_collapse/out_collapsed_table", 
                            "id": "#qiime2-09-ancom.cwl/comp_gut_table_l6/table"
                        }
                    ], 
                    "out": [
                        "#qiime2-09-ancom.cwl/comp_gut_table_l6/out_comp_table"
                    ], 
                    "id": "#qiime2-09-ancom.cwl/comp_gut_table_l6"
                }, 
                {
                    "run": "#feature-table-filter-samples.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-09-ancom.cwl/filter_sample_query", 
                            "id": "#qiime2-09-ancom.cwl/filter_gut_samples/filter_where"
                        }, 
                        {
                            "valueFrom": "gut-table.qza", 
                            "id": "#qiime2-09-ancom.cwl/filter_gut_samples/filtered_table_filename"
                        }, 
                        {
                            "source": "#qiime2-09-ancom.cwl/sample_metadata", 
                            "id": "#qiime2-09-ancom.cwl/filter_gut_samples/sample_metadata_file"
                        }, 
                        {
                            "source": "#qiime2-09-ancom.cwl/table", 
                            "id": "#qiime2-09-ancom.cwl/filter_gut_samples/table"
                        }
                    ], 
                    "out": [
                        "#qiime2-09-ancom.cwl/filter_gut_samples/filtered_table"
                    ], 
                    "id": "#qiime2-09-ancom.cwl/filter_gut_samples"
                }, 
                {
                    "run": "#taxa-collapse.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-09-ancom.cwl/collapse_level", 
                            "id": "#qiime2-09-ancom.cwl/gut_table_collapse/collapse_level"
                        }, 
                        {
                            "valueFrom": "gut-table-l6.qza", 
                            "id": "#qiime2-09-ancom.cwl/gut_table_collapse/collapsed_table"
                        }, 
                        {
                            "source": "#qiime2-09-ancom.cwl/filter_gut_samples/filtered_table", 
                            "id": "#qiime2-09-ancom.cwl/gut_table_collapse/table"
                        }, 
                        {
                            "source": "#qiime2-09-ancom.cwl/taxonomy", 
                            "id": "#qiime2-09-ancom.cwl/gut_table_collapse/taxonomy_file"
                        }
                    ], 
                    "out": [
                        "#qiime2-09-ancom.cwl/gut_table_collapse/out_collapsed_table"
                    ], 
                    "id": "#qiime2-09-ancom.cwl/gut_table_collapse"
                }, 
                {
                    "run": "#composition-add-pseudocount.cwl", 
                    "in": [
                        {
                            "valueFrom": "comp-gut-table.qza", 
                            "id": "#qiime2-09-ancom.cwl/pseudocount_gut_table/composition"
                        }, 
                        {
                            "source": "#qiime2-09-ancom.cwl/filter_gut_samples/filtered_table", 
                            "id": "#qiime2-09-ancom.cwl/pseudocount_gut_table/table"
                        }
                    ], 
                    "out": [
                        "#qiime2-09-ancom.cwl/pseudocount_gut_table/out_comp_table"
                    ], 
                    "id": "#qiime2-09-ancom.cwl/pseudocount_gut_table"
                }
            ], 
            "id": "#qiime2-09-ancom.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Perform de novo multiple sequence alignment using MAFFT", 
            "hints": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "qiime2/core:2018.4", 
                    "id": "#qiime2-docker-hint.yml", 
                    "name": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "label": "resulting aligned sequences filename", 
                    "inputBinding": {
                        "prefix": "--o-alignment"
                    }, 
                    "id": "#alignment-mafft.cwl/alignment_filename"
                }, 
                {
                    "type": "File", 
                    "label": "sequences to be aligned", 
                    "inputBinding": {
                        "prefix": "--i-sequences"
                    }, 
                    "id": "#alignment-mafft.cwl/sequences"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.alignment_filename)"
                    }, 
                    "id": "#alignment-mafft.cwl/alignment"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "alignment", 
                "mafft"
            ], 
            "id": "#alignment-mafft.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Mask unconserved and highly gapped columns from an alignment", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "alignment to be masked", 
                    "inputBinding": {
                        "prefix": "--i-alignment"
                    }, 
                    "id": "#alignment-mask.cwl/alignment"
                }, 
                {
                    "type": "string", 
                    "label": "masked alignment filename", 
                    "inputBinding": {
                        "prefix": "--o-masked-alignment"
                    }, 
                    "id": "#alignment-mask.cwl/masked_aligned_rep_seqs_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.masked_aligned_rep_seqs_filename)"
                    }, 
                    "id": "#alignment-mask.cwl/masked_aligned_rep_seqs"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "alignment", 
                "mask"
            ], 
            "id": "#alignment-mask.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Increment all counts in table by pseudocount", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "inputBinding": {
                        "prefix": "--o-composition-table"
                    }, 
                    "label": "resulting feature table filename", 
                    "type": "string", 
                    "default": "comp-table.qza", 
                    "id": "#composition-add-pseudocount.cwl/composition"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--i-table"
                    }, 
                    "label": "feature table to which pseudocounts should be added", 
                    "type": "File", 
                    "id": "#composition-add-pseudocount.cwl/table"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.composition)"
                    }, 
                    "id": "#composition-add-pseudocount.cwl/out_comp_table"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "composition", 
                "add-pseudocount"
            ], 
            "id": "#composition-add-pseudocount.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Apply ANCOM to identify features that are differentially abundant across groups", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "inputBinding": {
                        "prefix": "--i-table"
                    }, 
                    "label": "The feature table to be used for ANCOM computation", 
                    "type": "File", 
                    "id": "#composition-ancom.cwl/comp_table"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "label": "Resulting visualization filename", 
                    "type": "string", 
                    "default": "ancom.qzv", 
                    "id": "#composition-ancom.cwl/feat_visualization"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--m-metadata-column"
                    }, 
                    "label": "Column from metadata file or artifact viewable as metadata", 
                    "type": "string", 
                    "id": "#composition-ancom.cwl/metadata_column"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--m-metadata-file"
                    }, 
                    "label": "Metadata file or artifact viewable as metadata", 
                    "type": "File", 
                    "id": "#composition-ancom.cwl/metadata_file"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.feat_visualization)"
                    }, 
                    "id": "#composition-ancom.cwl/out_visual"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "composition", 
                "ancom"
            ], 
            "id": "#composition-ancom.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Perform sequence quality control for Illumina data using the Deblur workflow with a 16S reference as a positive filter", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "The demultiplexed sequences to be denoised", 
                    "inputBinding": {
                        "prefix": "--i-demultiplexed-seqs"
                    }, 
                    "id": "#deblur-denoise-16S.cwl/demultiplexed_seqs"
                }, 
                {
                    "type": "string", 
                    "label": "The resulting feature sequences filename", 
                    "inputBinding": {
                        "prefix": "--o-representative-sequences"
                    }, 
                    "default": "rep-seqs.qza", 
                    "id": "#deblur-denoise-16S.cwl/representative_sequences_filename"
                }, 
                {
                    "type": "string", 
                    "label": "The resulting per-sample stats filename", 
                    "inputBinding": {
                        "prefix": "--o-stats"
                    }, 
                    "default": "stats.qza", 
                    "id": "#deblur-denoise-16S.cwl/stats_filename"
                }, 
                {
                    "type": "string", 
                    "label": "The resulting denoised feature table filename", 
                    "inputBinding": {
                        "prefix": "--o-table"
                    }, 
                    "default": "table.qza", 
                    "id": "#deblur-denoise-16S.cwl/table_filename"
                }, 
                {
                    "type": "int", 
                    "label": "Sequence trim length, specify -1 to disable trimming", 
                    "inputBinding": {
                        "prefix": "--p-trim-length"
                    }, 
                    "id": "#deblur-denoise-16S.cwl/trim_length"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.representative_sequences_filename)"
                    }, 
                    "id": "#deblur-denoise-16S.cwl/representative_sequences"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.stats_filename)"
                    }, 
                    "id": "#deblur-denoise-16S.cwl/stats"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.table_filename)"
                    }, 
                    "id": "#deblur-denoise-16S.cwl/table"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "deblur", 
                "denoise-16S", 
                "--p-sample-stats"
            ], 
            "id": "#deblur-denoise-16S.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Display Deblur statistics per sample", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "label": "The resulting visualization filename", 
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "default": "deblur-stats.qzv", 
                    "id": "#deblur-visualize-stats.cwl/deblur_stats_filename"
                }, 
                {
                    "type": "File", 
                    "label": "Summary statistics of the Deblur proces", 
                    "inputBinding": {
                        "prefix": "--i-deblur-stats"
                    }, 
                    "id": "#deblur-visualize-stats.cwl/input_file"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.deblur_stats_filename)"
                    }, 
                    "id": "#deblur-visualize-stats.cwl/deblur_stats"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "deblur", 
                "visualize-stats"
            ], 
            "id": "#deblur-visualize-stats.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Classify reads by taxon using a fitted classifier", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "inputBinding": {
                        "prefix": "--i-classifier"
                    }, 
                    "label": "The taxonomic classifier for classifying the reads", 
                    "type": "File", 
                    "id": "#feature-classifier-classify-sklearn.cwl/classifier"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--i-reads"
                    }, 
                    "label": "The feature data to be classified", 
                    "type": "File", 
                    "id": "#feature-classifier-classify-sklearn.cwl/rep_seqs"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--o-classification"
                    }, 
                    "label": "Resulting taxonomy filename", 
                    "type": "string", 
                    "default": "taxonomy.qza", 
                    "id": "#feature-classifier-classify-sklearn.cwl/taxonomy_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.taxonomy_filename)"
                    }, 
                    "id": "#feature-classifier-classify-sklearn.cwl/out_taxa"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "feature-classifier", 
                "classify-sklearn"
            ], 
            "id": "#feature-classifier-classify-sklearn.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Filter samples from table based on frequency and/or metadata", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "label": "Filter string to filter samples by", 
                    "default": "BodySite='gut'", 
                    "inputBinding": {
                        "prefix": "--p-where"
                    }, 
                    "id": "#feature-table-filter-samples.cwl/filter_where"
                }, 
                {
                    "type": "string", 
                    "label": "resulting filtered table filename", 
                    "inputBinding": {
                        "prefix": "--o-filtered-table"
                    }, 
                    "id": "#feature-table-filter-samples.cwl/filtered_table_filename"
                }, 
                {
                    "type": "File", 
                    "label": "metadata file or artifact viewable as metadata", 
                    "inputBinding": {
                        "prefix": "--m-metadata-file"
                    }, 
                    "id": "#feature-table-filter-samples.cwl/sample_metadata_file"
                }, 
                {
                    "type": "File", 
                    "label": "feature table to be summarized", 
                    "inputBinding": {
                        "prefix": "--i-table"
                    }, 
                    "id": "#feature-table-filter-samples.cwl/table"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.filtered_table_filename)"
                    }, 
                    "id": "#feature-table-filter-samples.cwl/filtered_table"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "feature-table", 
                "filter-samples"
            ], 
            "id": "#feature-table-filter-samples.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Generate visual and tabular summaries of a feature table", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "metadata file or artifact viewable as metadata", 
                    "inputBinding": {
                        "prefix": "--m-sample-metadata-file"
                    }, 
                    "id": "#feature-table-summarize.cwl/sample_metadata_file"
                }, 
                {
                    "type": "File", 
                    "label": "feature table to be summarized", 
                    "inputBinding": {
                        "prefix": "--i-table"
                    }, 
                    "id": "#feature-table-summarize.cwl/table"
                }, 
                {
                    "type": "string", 
                    "label": "filename for the resulting visualization file", 
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "id": "#feature-table-summarize.cwl/visualization_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.visualization_filename)"
                    }, 
                    "id": "#feature-table-summarize.cwl/visualization"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "feature-table", 
                "summarize"
            ], 
            "id": "#feature-table-summarize.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Generate tabular view of feature identifier to sequence mapping, including links to BLAST each sequence against the NCBI nt database", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "feature sequences to be tabulated", 
                    "inputBinding": {
                        "prefix": "--i-data"
                    }, 
                    "id": "#feature-table-tabulate-seqs.cwl/data"
                }, 
                {
                    "type": "string", 
                    "label": "filename for the resulting visualization file", 
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "id": "#feature-table-tabulate-seqs.cwl/visualization_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.visualization_filename)"
                    }, 
                    "id": "#feature-table-tabulate-seqs.cwl/visualization"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "feature-table", 
                "tabulate-seqs"
            ], 
            "id": "#feature-table-tabulate-seqs.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Generate a tabular view of metadata", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "metadata file or artifact viewable as metadata", 
                    "inputBinding": {
                        "prefix": "--m-input-file"
                    }, 
                    "id": "#metadata-tabulate.cwl/input_file"
                }, 
                {
                    "type": "string", 
                    "label": "filename for the resulting visualization file", 
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "id": "#metadata-tabulate.cwl/visualization_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.visualization_filename)"
                    }, 
                    "id": "#metadata-tabulate.cwl/visualization_artifact"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "metadata", 
                "tabulate"
            ], 
            "id": "#metadata-tabulate.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Construct a phylogenetic tree with FastTree", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "aligned sequences to be used for phylogenetic reconstruction", 
                    "inputBinding": {
                        "prefix": "--i-alignment"
                    }, 
                    "id": "#phylogeny-fasttree.cwl/alignment"
                }, 
                {
                    "type": "string", 
                    "label": "resulting phylogenetic tree filename", 
                    "inputBinding": {
                        "prefix": "--o-tree"
                    }, 
                    "id": "#phylogeny-fasttree.cwl/tree_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.tree_filename)"
                    }, 
                    "id": "#phylogeny-fasttree.cwl/unrooted_tree"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "phylogeny", 
                "fasttree"
            ], 
            "id": "#phylogeny-fasttree.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Midpoint root an unrooted phylogenetic tree", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "label": "rooted phylogenetic tree", 
                    "inputBinding": {
                        "prefix": "--o-rooted-tree"
                    }, 
                    "id": "#phylogeny-midpoint-root.cwl/rooted_tree_filename"
                }, 
                {
                    "type": "File", 
                    "label": "phylogenetic tree to be rooted", 
                    "inputBinding": {
                        "prefix": "--i-tree"
                    }, 
                    "id": "#phylogeny-midpoint-root.cwl/tree"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.rooted_tree_filename)"
                    }, 
                    "id": "#phylogeny-midpoint-root.cwl/rooted_tree"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "phylogeny", 
                "midpoint-root"
            ], 
            "id": "#phylogeny-midpoint-root.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Filter sequences based on quality scores and the presence of ambiguous base calls", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "The demultiplexed sequence data to be quality filtered", 
                    "inputBinding": {
                        "prefix": "--i-demux"
                    }, 
                    "id": "#quality-filter-q-score.cwl/demux"
                }, 
                {
                    "type": "string", 
                    "doc": "Summary statistics of the filtering process filename", 
                    "inputBinding": {
                        "prefix": "--o-filter-stats"
                    }, 
                    "default": "demux-filter-stats.qza", 
                    "id": "#quality-filter-q-score.cwl/filter_stats_filename"
                }, 
                {
                    "type": "string", 
                    "doc": "The resulting quality-filtered sequences filename", 
                    "inputBinding": {
                        "prefix": "--o-filtered-sequences"
                    }, 
                    "default": "demux-filtered.qza", 
                    "id": "#quality-filter-q-score.cwl/filtered_sequences_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.filter_stats_filename)"
                    }, 
                    "id": "#quality-filter-q-score.cwl/filter_stats"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.filtered_sequences_filename)"
                    }, 
                    "id": "#quality-filter-q-score.cwl/filtered_sequences"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "quality-filter", 
                "q-score"
            ], 
            "id": "#quality-filter-q-score.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Produce an interactive barplot visualization of taxonomies", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "Metadata file or artifact viewable as metadata", 
                    "inputBinding": {
                        "prefix": "--m-metadata-file"
                    }, 
                    "id": "#taxa-barplot.cwl/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "label": "Feature table to visualize at various taxonomic levels", 
                    "inputBinding": {
                        "prefix": "--i-table"
                    }, 
                    "id": "#taxa-barplot.cwl/table"
                }, 
                {
                    "type": "string", 
                    "label": "The resulting visualization filename", 
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "id": "#taxa-barplot.cwl/taxa_bar_plots_filename"
                }, 
                {
                    "type": "File", 
                    "label": "Taxonomic annotations for features in the provided feature table", 
                    "inputBinding": {
                        "prefix": "--i-taxonomy"
                    }, 
                    "id": "#taxa-barplot.cwl/taxonomy"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.taxa_bar_plots_filename)"
                    }, 
                    "id": "#taxa-barplot.cwl/taxa_bar_plots"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "taxa", 
                "barplot"
            ], 
            "id": "#taxa-barplot.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Collapse groups of features that have the same taxonomic assignment through the specified level", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "inputBinding": {
                        "prefix": "--p-level"
                    }, 
                    "label": "The taxonomic level at which the features should be collapsed", 
                    "type": "int", 
                    "default": 2, 
                    "id": "#taxa-collapse.cwl/collapse_level"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--o-collapsed-table"
                    }, 
                    "label": "The resulting feature table, where all features are now taxonomic annotations with the user-specified number of levels", 
                    "type": "string", 
                    "default": "coll-table.qza", 
                    "id": "#taxa-collapse.cwl/collapsed_table"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--i-table"
                    }, 
                    "label": "Feature table to be collapsed", 
                    "type": "File", 
                    "id": "#taxa-collapse.cwl/table"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--i-taxonomy"
                    }, 
                    "label": "Taxonomic annotations for features in the provided feature table", 
                    "type": "File", 
                    "id": "#taxa-collapse.cwl/taxonomy_file"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.collapsed_table)"
                    }, 
                    "id": "#taxa-collapse.cwl/out_collapsed_table"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "taxa", 
                "collapse"
            ], 
            "id": "#taxa-collapse.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "QIIME2 Step 2 (Deblur option)", 
            "doc": "QIIME2 Deblur, feature summaries, phylogenetic diversity tree, taxonomic analysis and ancom\n", 
            "inputs": [
                {
                    "type": "int", 
                    "id": "#main/ancom_collapse_level"
                }, 
                {
                    "type": "string", 
                    "id": "#main/ancom_filter_sample_query"
                }, 
                {
                    "type": "int", 
                    "id": "#main/deblur_trim_length"
                }, 
                {
                    "type": "File", 
                    "id": "#main/demux_sequences_artifact"
                }, 
                {
                    "type": "File", 
                    "id": "#main/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "id": "#main/taxonomic_classifier"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#main/phylogenetic_tree/aligned_representative_sequences", 
                    "id": "#main/aligned_representative_sequences"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/ancom_diff_abundance/ancom_subject_16_visualization_file", 
                    "id": "#main/ancom_subject_16_visualization_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/ancom_diff_abundance/ancom_visualization_file", 
                    "id": "#main/ancom_visualization_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/ancom_diff_abundance/collapsed_table_file", 
                    "id": "#main/collapsed_table_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/ancom_diff_abundance/comp_gut_table_l6_file", 
                    "id": "#main/comp_gut_table_l6_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/ancom_diff_abundance/composition_table_file", 
                    "id": "#main/composition_table_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/deblur_sequences/demux_filter_stats", 
                    "id": "#main/deblur_demux_filter_stats"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/deblur_sequences/filter_stats", 
                    "id": "#main/deblur_filter_stats"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/deblur_sequences/filtered_sequences", 
                    "id": "#main/deblur_filtered_sequences"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/deblur_sequences/rep_seqs", 
                    "id": "#main/deblur_rep_seqs"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/deblur_sequences/stats", 
                    "id": "#main/deblur_stats"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/deblur_sequences/stats_visualization", 
                    "id": "#main/deblur_stats_visualization"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/deblur_sequences/table", 
                    "id": "#main/deblur_table"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/feature_table_visualizations/feature_table_summarize_visualization", 
                    "id": "#main/feature_table_summarize_visualization"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/feature_table_visualizations/feature_table_tabulation_visualization", 
                    "id": "#main/feature_table_tabulation_visualization"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/ancom_diff_abundance/filter_table_file", 
                    "id": "#main/filter_table_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/phylogenetic_tree/masked_representative_sequences", 
                    "id": "#main/masked_representative_sequences"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/phylogenetic_tree/rooted_tree", 
                    "id": "#main/rooted_tree"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/taxonomic_analysis/taxa_barplot_file", 
                    "id": "#main/taxa_barplot_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/taxonomic_analysis/taxonomy_artifact", 
                    "id": "#main/taxonomy_artifact"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/taxonomic_analysis/taxonomy_visualization_file", 
                    "id": "#main/taxonomy_visualization_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/phylogenetic_tree/unrooted_tree", 
                    "id": "#main/unrooted_tree"
                }
            ], 
            "steps": [
                {
                    "run": "#qiime2-09-ancom.cwl", 
                    "in": [
                        {
                            "source": "#main/ancom_collapse_level", 
                            "id": "#main/ancom_diff_abundance/collapse_level"
                        }, 
                        {
                            "source": "#main/ancom_filter_sample_query", 
                            "id": "#main/ancom_diff_abundance/filter_sample_query"
                        }, 
                        {
                            "source": "#main/sample_metadata", 
                            "id": "#main/ancom_diff_abundance/sample_metadata"
                        }, 
                        {
                            "source": "#main/deblur_sequences/table", 
                            "id": "#main/ancom_diff_abundance/table"
                        }, 
                        {
                            "source": "#main/taxonomic_analysis/taxonomy_artifact", 
                            "id": "#main/ancom_diff_abundance/taxonomy"
                        }
                    ], 
                    "out": [
                        "#main/ancom_diff_abundance/filter_table_file", 
                        "#main/ancom_diff_abundance/composition_table_file", 
                        "#main/ancom_diff_abundance/ancom_visualization_file", 
                        "#main/ancom_diff_abundance/collapsed_table_file", 
                        "#main/ancom_diff_abundance/comp_gut_table_l6_file", 
                        "#main/ancom_diff_abundance/ancom_subject_16_visualization_file"
                    ], 
                    "id": "#main/ancom_diff_abundance"
                }, 
                {
                    "run": "#qiime2-03-deblur.cwl", 
                    "in": [
                        {
                            "source": "#main/demux_sequences_artifact", 
                            "id": "#main/deblur_sequences/demux_sequences_artifact"
                        }, 
                        {
                            "source": "#main/deblur_trim_length", 
                            "id": "#main/deblur_sequences/trim_length"
                        }
                    ], 
                    "out": [
                        "#main/deblur_sequences/filtered_sequences", 
                        "#main/deblur_sequences/filter_stats", 
                        "#main/deblur_sequences/rep_seqs", 
                        "#main/deblur_sequences/table", 
                        "#main/deblur_sequences/stats", 
                        "#main/deblur_sequences/demux_filter_stats", 
                        "#main/deblur_sequences/stats_visualization"
                    ], 
                    "id": "#main/deblur_sequences"
                }, 
                {
                    "run": "#qiime2-04-features.cwl", 
                    "in": [
                        {
                            "source": "#main/deblur_sequences/table", 
                            "id": "#main/feature_table_visualizations/feature_table_artifact"
                        }, 
                        {
                            "source": "#main/deblur_sequences/rep_seqs", 
                            "id": "#main/feature_table_visualizations/rep_seqs_artifact"
                        }, 
                        {
                            "source": "#main/sample_metadata", 
                            "id": "#main/feature_table_visualizations/sample_metadata"
                        }
                    ], 
                    "out": [
                        "#main/feature_table_visualizations/feature_table_summarize_visualization", 
                        "#main/feature_table_visualizations/feature_table_tabulation_visualization"
                    ], 
                    "id": "#main/feature_table_visualizations"
                }, 
                {
                    "run": "#qiime2-05-phylogeny.cwl", 
                    "in": [
                        {
                            "source": "#main/deblur_sequences/rep_seqs", 
                            "id": "#main/phylogenetic_tree/representative_sequences"
                        }
                    ], 
                    "out": [
                        "#main/phylogenetic_tree/aligned_representative_sequences", 
                        "#main/phylogenetic_tree/masked_representative_sequences", 
                        "#main/phylogenetic_tree/unrooted_tree", 
                        "#main/phylogenetic_tree/rooted_tree"
                    ], 
                    "id": "#main/phylogenetic_tree"
                }, 
                {
                    "run": "#qiime2-08-taxonomic-analysis.cwl", 
                    "in": [
                        {
                            "source": "#main/taxonomic_classifier", 
                            "id": "#main/taxonomic_analysis/classifier"
                        }, 
                        {
                            "source": "#main/deblur_sequences/rep_seqs", 
                            "id": "#main/taxonomic_analysis/rep_seqs"
                        }, 
                        {
                            "source": "#main/sample_metadata", 
                            "id": "#main/taxonomic_analysis/sample_metadata"
                        }, 
                        {
                            "source": "#main/deblur_sequences/table", 
                            "id": "#main/taxonomic_analysis/table"
                        }
                    ], 
                    "out": [
                        "#main/taxonomic_analysis/taxonomy_artifact", 
                        "#main/taxonomic_analysis/taxonomy_visualization_file", 
                        "#main/taxonomic_analysis/taxa_barplot_file"
                    ], 
                    "id": "#main/taxonomic_analysis"
                }
            ], 
            "id": "#main"
        }
    ]
}