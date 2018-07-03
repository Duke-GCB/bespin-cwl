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
            "label": "qiime2 DADA2 detect/correct paired sequence data", 
            "doc": "Option 1: DADA2 from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "string", 
                    "default": "stats.qza", 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_denoising_stats_filename"
                }, 
                {
                    "type": "string", 
                    "default": "rep-seqs.qza", 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_representative_sequences_filename"
                }, 
                {
                    "type": "string", 
                    "default": "stats.qzv", 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_stats_filename"
                }, 
                {
                    "type": "string", 
                    "default": "table.qza", 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_table_filename"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-03-dada2-paired.cwl/demux_sequences_artifact"
                }, 
                {
                    "type": "int", 
                    "id": "#qiime2-03-dada2-paired.cwl/n_threads"
                }, 
                {
                    "type": "int", 
                    "id": "#qiime2-03-dada2-paired.cwl/trim_left_f"
                }, 
                {
                    "type": "int", 
                    "id": "#qiime2-03-dada2-paired.cwl/trim_left_r"
                }, 
                {
                    "type": "int", 
                    "id": "#qiime2-03-dada2-paired.cwl/trunc_len_f"
                }, 
                {
                    "type": "int", 
                    "id": "#qiime2-03-dada2-paired.cwl/trunc_len_r"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/denoising_stats", 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_denoising_stats"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/representative_sequences", 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_representative_sequences"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/table", 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_table"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-03-dada2-paired.cwl/dada2_visualization/visualization_artifact", 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_visualization_artifact"
                }
            ], 
            "steps": [
                {
                    "run": "#dada2-denoise-paired.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/demux_sequences_artifact", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/demultiplexed_seqs"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/dada2_denoising_stats_filename", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/denoising_stats_filename"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/n_threads", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/n_threads"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/dada2_representative_sequences_filename", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/representative_sequences_filename"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/dada2_table_filename", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/table_filename"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/trim_left_f", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/trim_left_f"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/trim_left_r", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/trim_left_r"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/trunc_len_f", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/trunc_len_f"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/trunc_len_r", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/trunc_len_r"
                        }
                    ], 
                    "out": [
                        "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/representative_sequences", 
                        "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/table", 
                        "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/denoising_stats"
                    ], 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired"
                }, 
                {
                    "run": "#metadata-tabulate.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/dada2_denoise_paired/denoising_stats", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_visualization/input_file"
                        }, 
                        {
                            "source": "#qiime2-03-dada2-paired.cwl/dada2_stats_filename", 
                            "id": "#qiime2-03-dada2-paired.cwl/dada2_visualization/visualization_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-03-dada2-paired.cwl/dada2_visualization/visualization_artifact"
                    ], 
                    "id": "#qiime2-03-dada2-paired.cwl/dada2_visualization"
                }
            ], 
            "id": "#qiime2-03-dada2-paired.cwl"
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
                    "type": "string", 
                    "id": "#qiime2-04-features.cwl/filter_feature_table_where"
                }, 
                {
                    "type": "string", 
                    "default": "filtered-table.qzv", 
                    "id": "#qiime2-04-features.cwl/filtered_table_filename_filename"
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
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-04-features.cwl/filter_feature_table/filtered_table", 
                    "id": "#qiime2-04-features.cwl/filtered_feature_table_artifact"
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
                            "source": "#qiime2-04-features.cwl/filter_feature_table/filtered_table", 
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
                }, 
                {
                    "run": "#feature-table-filter-samples.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-04-features.cwl/filter_feature_table_where", 
                            "id": "#qiime2-04-features.cwl/filter_feature_table/filter_where"
                        }, 
                        {
                            "source": "#qiime2-04-features.cwl/filtered_table_filename_filename", 
                            "id": "#qiime2-04-features.cwl/filter_feature_table/filtered_table_filename"
                        }, 
                        {
                            "source": "#qiime2-04-features.cwl/sample_metadata", 
                            "id": "#qiime2-04-features.cwl/filter_feature_table/sample_metadata_file"
                        }, 
                        {
                            "source": "#qiime2-04-features.cwl/feature_table_artifact", 
                            "id": "#qiime2-04-features.cwl/filter_feature_table/table"
                        }
                    ], 
                    "out": [
                        "#qiime2-04-features.cwl/filter_feature_table/filtered_table"
                    ], 
                    "id": "#qiime2-04-features.cwl/filter_feature_table"
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
            "label": "qiime2: Ddenoises paired-end sequences, dereplicates them, and filters chimeras", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "single-end demultiplexed sequences to be denoised", 
                    "inputBinding": {
                        "prefix": "--i-demultiplexed-seqs"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/demultiplexed_seqs"
                }, 
                {
                    "type": "string", 
                    "label": "denoising stats filename", 
                    "inputBinding": {
                        "prefix": "--o-denoising-stats"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/denoising_stats_filename"
                }, 
                {
                    "type": "int", 
                    "label": "number of threads to use for multithreaded processing", 
                    "inputBinding": {
                        "prefix": "--p-n-threads"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/n_threads"
                }, 
                {
                    "type": "string", 
                    "label": "resulting feature sequences filename", 
                    "inputBinding": {
                        "prefix": "--o-representative-sequences"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/representative_sequences_filename"
                }, 
                {
                    "type": "string", 
                    "label": "resulting feature table filename", 
                    "inputBinding": {
                        "prefix": "--o-table"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/table_filename"
                }, 
                {
                    "type": "int", 
                    "label": "", 
                    "inputBinding": {
                        "prefix": "--p-trim-left-f"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/trim_left_f"
                }, 
                {
                    "type": "int", 
                    "label": "", 
                    "inputBinding": {
                        "prefix": "--p-trim-left-r"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/trim_left_r"
                }, 
                {
                    "type": "int", 
                    "label": "", 
                    "inputBinding": {
                        "prefix": "--p-trunc-len-f"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/trunc_len_f"
                }, 
                {
                    "type": "int", 
                    "label": "", 
                    "inputBinding": {
                        "prefix": "--p-trunc-len-r"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/trunc_len_r"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.denoising_stats_filename)"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/denoising_stats"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.representative_sequences_filename)"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/representative_sequences"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.table_filename)"
                    }, 
                    "id": "#dada2-denoise-paired.cwl/table"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "dada2", 
                "denoise-paired"
            ], 
            "id": "#dada2-denoise-paired.cwl"
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
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "QIIME2 Step 2 (DADA2 option)", 
            "doc": "QIIME2 DADA2, feature summaries, phylogenetic diversity tree, taxonomic analysis and ancom\n", 
            "inputs": [
                {
                    "type": "int", 
                    "id": "#main/dada2_denoise_n_threads"
                }, 
                {
                    "type": "int", 
                    "id": "#main/dada2_trim_left_f"
                }, 
                {
                    "type": "int", 
                    "id": "#main/dada2_trim_left_r"
                }, 
                {
                    "type": "int", 
                    "id": "#main/dada2_trunc_len_f"
                }, 
                {
                    "type": "int", 
                    "id": "#main/dada2_trunc_len_r"
                }, 
                {
                    "type": "File", 
                    "id": "#main/demux_sequences_artifact"
                }, 
                {
                    "type": "string", 
                    "id": "#main/filter_feature_table_where"
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
                    "outputSource": "#main/dada2_sequences/dada2_denoising_stats", 
                    "id": "#main/dada2_denoising_stats"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/dada2_sequences/dada2_representative_sequences", 
                    "id": "#main/dada2_representative_sequences"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/dada2_sequences/dada2_table", 
                    "id": "#main/dada2_table"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/dada2_sequences/dada2_visualization_artifact", 
                    "id": "#main/dada2_visualization_artifact"
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
                    "outputSource": "#main/feature_table_visualizations/filtered_feature_table_artifact", 
                    "id": "#main/filtered_feature_table_artifact"
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
                    "run": "#qiime2-03-dada2-paired.cwl", 
                    "in": [
                        {
                            "source": "#main/demux_sequences_artifact", 
                            "id": "#main/dada2_sequences/demux_sequences_artifact"
                        }, 
                        {
                            "source": "#main/dada2_denoise_n_threads", 
                            "id": "#main/dada2_sequences/n_threads"
                        }, 
                        {
                            "source": "#main/dada2_trim_left_f", 
                            "id": "#main/dada2_sequences/trim_left_f"
                        }, 
                        {
                            "source": "#main/dada2_trim_left_r", 
                            "id": "#main/dada2_sequences/trim_left_r"
                        }, 
                        {
                            "source": "#main/dada2_trunc_len_f", 
                            "id": "#main/dada2_sequences/trunc_len_f"
                        }, 
                        {
                            "source": "#main/dada2_trunc_len_r", 
                            "id": "#main/dada2_sequences/trunc_len_r"
                        }
                    ], 
                    "out": [
                        "#main/dada2_sequences/dada2_representative_sequences", 
                        "#main/dada2_sequences/dada2_table", 
                        "#main/dada2_sequences/dada2_denoising_stats", 
                        "#main/dada2_sequences/dada2_visualization_artifact"
                    ], 
                    "id": "#main/dada2_sequences"
                }, 
                {
                    "run": "#qiime2-04-features.cwl", 
                    "in": [
                        {
                            "source": "#main/dada2_sequences/dada2_table", 
                            "id": "#main/feature_table_visualizations/feature_table_artifact"
                        }, 
                        {
                            "source": "#main/filter_feature_table_where", 
                            "id": "#main/feature_table_visualizations/filter_feature_table_where"
                        }, 
                        {
                            "source": "#main/dada2_sequences/dada2_representative_sequences", 
                            "id": "#main/feature_table_visualizations/rep_seqs_artifact"
                        }, 
                        {
                            "source": "#main/sample_metadata", 
                            "id": "#main/feature_table_visualizations/sample_metadata"
                        }
                    ], 
                    "out": [
                        "#main/feature_table_visualizations/filtered_feature_table_artifact", 
                        "#main/feature_table_visualizations/feature_table_summarize_visualization", 
                        "#main/feature_table_visualizations/feature_table_tabulation_visualization"
                    ], 
                    "id": "#main/feature_table_visualizations"
                }, 
                {
                    "run": "#qiime2-05-phylogeny.cwl", 
                    "in": [
                        {
                            "source": "#main/dada2_sequences/dada2_representative_sequences", 
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
                            "source": "#main/dada2_sequences/dada2_representative_sequences", 
                            "id": "#main/taxonomic_analysis/rep_seqs"
                        }, 
                        {
                            "source": "#main/sample_metadata", 
                            "id": "#main/taxonomic_analysis/sample_metadata"
                        }, 
                        {
                            "source": "#main/dada2_sequences/dada2_table", 
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