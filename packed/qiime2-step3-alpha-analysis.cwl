{
    "cwlVersion": "v1.0", 
    "$graph": [
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
            "label": "qiime2 diversity analyses", 
            "doc": "Alpha and beta diversity analysis from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "string", 
                    "default": "bray-curtis-emperor-DaysSinceExperimentStart.qzv", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor_filename"
                }, 
                {
                    "type": "string", 
                    "default": "evenness-group-significance.qzv", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance_filename"
                }, 
                {
                    "type": "string", 
                    "default": "faith-pd-group-significance.qzv", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance_filename"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/rooted_tree"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/sample_metadata"
                }, 
                {
                    "type": "int", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/sampling_depth"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/table"
                }, 
                {
                    "type": "string", 
                    "default": "unweighted-unifrac-body-site-significance.qzv", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance_filename"
                }, 
                {
                    "type": "string", 
                    "default": "unweighted-unifrac-emperor-DaysSinceExperimentStart.qzv", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor_filename"
                }, 
                {
                    "type": "string", 
                    "default": "unweighted-unifrac-subject-group-significance.qzv", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor/pcoa_visual", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor_file"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/out_dir", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/core_metrics_directory"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance/significance", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance/significance", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance/out_visual", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor/pcoa_visual", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance/out_visual", 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance_file"
                }
            ], 
            "steps": [
                {
                    "run": "#emperor-plot.cwl", 
                    "in": [
                        {
                            "valueFrom": "DaysSinceExperimentStart", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor/custom_axes"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/sample_metadata", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor/metadata_file"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor_filename", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor/out_visualization"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/bray_curtis_pcoa_results", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor/pcoa"
                        }
                    ], 
                    "out": [
                        "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor/pcoa_visual"
                    ], 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/bray_curtis_emperor"
                }, 
                {
                    "run": "#diversity-alpha-group-significance.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/evenness_vector", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance/alpha_diversity"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/sample_metadata", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance/metadata_file"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance_filename", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance/output_significance_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance/significance"
                    ], 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/evenness_group_significance"
                }, 
                {
                    "run": "#diversity-alpha-group-significance.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/faith_pd_vector", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance/alpha_diversity"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/sample_metadata", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance/metadata_file"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance_filename", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance/output_significance_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance/significance"
                    ], 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/faith_pd_group_significance"
                }, 
                {
                    "run": "#diversity-core-metrics-phylogenetic.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/table", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/input_table"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/rooted_tree", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/input_tree"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/sample_metadata", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/metadata_file"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/sampling_depth", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/sampling_depth"
                        }
                    ], 
                    "out": [
                        "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/out_dir", 
                        "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/faith_pd_vector", 
                        "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/evenness_vector", 
                        "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/unweighted_unifrac_distance_matrix", 
                        "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/unweighted_unifrac_pcoa_results", 
                        "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/bray_curtis_pcoa_results"
                    ], 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics"
                }, 
                {
                    "run": "#diversity-beta-group-significance.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/unweighted_unifrac_distance_matrix", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance/distance_matrix"
                        }, 
                        {
                            "valueFrom": "BodySite", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance/metadata_column"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/sample_metadata", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance/metadata_file"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance_filename", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance/output_significance_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance/out_visual"
                    ], 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_body_site_significance"
                }, 
                {
                    "run": "#emperor-plot.cwl", 
                    "in": [
                        {
                            "valueFrom": "DaysSinceExperimentStart", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor/custom_axes"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/sample_metadata", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor/metadata_file"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor_filename", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor/out_visualization"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/unweighted_unifrac_pcoa_results", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor/pcoa"
                        }
                    ], 
                    "out": [
                        "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor/pcoa_visual"
                    ], 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_emperor"
                }, 
                {
                    "run": "#diversity-beta-group-significance.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/generate_core_metrics/unweighted_unifrac_distance_matrix", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance/distance_matrix"
                        }, 
                        {
                            "valueFrom": "Subject", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance/metadata_column"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/sample_metadata", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance/metadata_file"
                        }, 
                        {
                            "source": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance_filename", 
                            "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance/output_significance_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance/out_visual"
                    ], 
                    "id": "#qiime2-06-alpha-beta-diversity.cwl/unweighted_unifrac_subject_group_significance"
                }
            ], 
            "id": "#qiime2-06-alpha-beta-diversity.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "qiime2 rarefaction visualization", 
            "doc": "Alpha rarefaction plotting from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "int", 
                    "id": "#qiime2-07-alpha-rarefaction.cwl/max_depth"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-07-alpha-rarefaction.cwl/rooted_tree"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-07-alpha-rarefaction.cwl/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-07-alpha-rarefaction.cwl/table"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-07-alpha-rarefaction.cwl/alpha_rarefaction/alpha_rarefaction", 
                    "id": "#qiime2-07-alpha-rarefaction.cwl/alpha_rarefaction_file"
                }
            ], 
            "steps": [
                {
                    "run": "#diversity-alpha-rarefaction.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-07-alpha-rarefaction.cwl/max_depth", 
                            "id": "#qiime2-07-alpha-rarefaction.cwl/alpha_rarefaction/max_depth"
                        }, 
                        {
                            "source": "#qiime2-07-alpha-rarefaction.cwl/rooted_tree", 
                            "id": "#qiime2-07-alpha-rarefaction.cwl/alpha_rarefaction/rooted_tree"
                        }, 
                        {
                            "source": "#qiime2-07-alpha-rarefaction.cwl/sample_metadata", 
                            "id": "#qiime2-07-alpha-rarefaction.cwl/alpha_rarefaction/sample_metadata"
                        }, 
                        {
                            "source": "#qiime2-07-alpha-rarefaction.cwl/table", 
                            "id": "#qiime2-07-alpha-rarefaction.cwl/alpha_rarefaction/table"
                        }
                    ], 
                    "out": [
                        "#qiime2-07-alpha-rarefaction.cwl/alpha_rarefaction/alpha_rarefaction"
                    ], 
                    "id": "#qiime2-07-alpha-rarefaction.cwl/alpha_rarefaction"
                }
            ], 
            "id": "#qiime2-07-alpha-rarefaction.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Visually and statistically compare groups of alpha diversity values", 
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
                    "inputBinding": {
                        "prefix": "--i-alpha-diversity"
                    }, 
                    "label": "Vector of alpha diversity values by sample", 
                    "type": "File", 
                    "id": "#diversity-alpha-group-significance.cwl/alpha_diversity"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--m-metadata-file"
                    }, 
                    "label": "Metadata file or artifact viewable as metadata", 
                    "type": "File", 
                    "id": "#diversity-alpha-group-significance.cwl/metadata_file"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "label": "The resulting visualization filename", 
                    "type": "string", 
                    "id": "#diversity-alpha-group-significance.cwl/output_significance_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_significance_filename)"
                    }, 
                    "id": "#diversity-alpha-group-significance.cwl/significance"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "diversity", 
                "alpha-group-significance"
            ], 
            "id": "#diversity-alpha-group-significance.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Generate interactive alpha rarefaction curves by computing rarefactions between a depth range.", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "label": "resulting visualization filename", 
                    "default": "alpha-rarefaction.qzv", 
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "id": "#diversity-alpha-rarefaction.cwl/alpha_rarefaction_filename"
                }, 
                {
                    "type": "int", 
                    "label": "The maximum rarefaction depth", 
                    "inputBinding": {
                        "prefix": "--p-max-depth"
                    }, 
                    "id": "#diversity-alpha-rarefaction.cwl/max_depth"
                }, 
                {
                    "type": "File", 
                    "label": "phylogeny for phylogenetic metrics", 
                    "inputBinding": {
                        "prefix": "--i-phylogeny"
                    }, 
                    "id": "#diversity-alpha-rarefaction.cwl/rooted_tree"
                }, 
                {
                    "type": "File", 
                    "label": "Metadata file or artifact viewable as metadata", 
                    "inputBinding": {
                        "prefix": "--m-metadata-file"
                    }, 
                    "id": "#diversity-alpha-rarefaction.cwl/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "label": "Feature table to compute rarefaction curves from", 
                    "inputBinding": {
                        "prefix": "--i-table"
                    }, 
                    "id": "#diversity-alpha-rarefaction.cwl/table"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.alpha_rarefaction_filename)"
                    }, 
                    "id": "#diversity-alpha-rarefaction.cwl/alpha_rarefaction"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "diversity", 
                "alpha-rarefaction"
            ], 
            "id": "#diversity-alpha-rarefaction.cwl"
        }, 
        {
            "label": "qiime2: Determine whether groups of samples are significantly different from one another using a permutation-based statistical test", 
            "class": "CommandLineTool", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "inputBinding": {
                        "prefix": "--i-distance-matrix"
                    }, 
                    "label": "Matrix of distances between pairs of samples", 
                    "type": "File", 
                    "id": "#diversity-beta-group-significance.cwl/distance_matrix"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--m-metadata-column"
                    }, 
                    "label": "Column from metadata file or artifact viewable as metadata", 
                    "type": "string", 
                    "id": "#diversity-beta-group-significance.cwl/metadata_column"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--m-metadata-file"
                    }, 
                    "label": "Metadata file or artifact viewable as metadata", 
                    "type": "File", 
                    "id": "#diversity-beta-group-significance.cwl/metadata_file"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "label": "resulting visualization filename", 
                    "type": "string", 
                    "id": "#diversity-beta-group-significance.cwl/output_significance_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_significance_filename)"
                    }, 
                    "id": "#diversity-beta-group-significance.cwl/out_visual"
                }
            ], 
            "arguments": [
                {
                    "prefix": "--p-pairwise\""
                }
            ], 
            "baseCommand": [
                "qiime", 
                "diversity", 
                "beta-group-significance"
            ], 
            "id": "#diversity-beta-group-significance.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Applies a collection of diversity metrics (both phylogenetic and non-phylogenetic) to a feature table.", 
            "baseCommand": [
                "qiime", 
                "diversity", 
                "core-metrics-phylogenetic"
            ], 
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
                    "doc": "The feature table containing the samples over which diversity metrics should be computed", 
                    "type": "File", 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/input_table"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--i-phylogeny"
                    }, 
                    "label": "Phylogenetic tree containing tip identifiers that correspond to the feature identifiers in the table", 
                    "type": "File", 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/input_tree"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--m-metadata-file"
                    }, 
                    "label": "Metadata file or artifact viewable as metadata", 
                    "type": "File", 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/metadata_file"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--output-dir"
                    }, 
                    "type": "string", 
                    "label": "name of the directory to contain the results", 
                    "default": "core-metrics-results", 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/output_dir_name"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--p-sampling-depth"
                    }, 
                    "label": "The total frequency that each sample should be rarefied to prior to computing diversity metrics", 
                    "type": "int", 
                    "default": 1080, 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/sampling_depth"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_dir_name + '/bray_curtis_pcoa_results.qza')"
                    }, 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/bray_curtis_pcoa_results"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_dir_name + '/evenness_vector.qza')"
                    }, 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/evenness_vector"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_dir_name + '/faith_pd_vector.qza')"
                    }, 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/faith_pd_vector"
                }, 
                {
                    "type": "Directory", 
                    "outputBinding": {
                        "glob": "$(inputs.output_dir_name)"
                    }, 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/out_dir"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_dir_name + '/unweighted_unifrac_distance_matrix.qza')"
                    }, 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/unweighted_unifrac_distance_matrix"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_dir_name + '/unweighted_unifrac_pcoa_results.qza')"
                    }, 
                    "id": "#diversity-core-metrics-phylogenetic.cwl/unweighted_unifrac_pcoa_results"
                }
            ], 
            "id": "#diversity-core-metrics-phylogenetic.cwl"
        }, 
        {
            "label": "qiime2: emperor visualization and ordination", 
            "class": "CommandLineTool", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "label": "Name for custom axis label", 
                    "inputBinding": {
                        "prefix": "--p-custom-axes"
                    }, 
                    "type": "string", 
                    "id": "#emperor-plot.cwl/custom_axes"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--m-metadata-file"
                    }, 
                    "label": "Metadata file or artifact viewable as metadata", 
                    "type": "File", 
                    "id": "#emperor-plot.cwl/metadata_file"
                }, 
                {
                    "label": "resulting visualization filename", 
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "type": "string", 
                    "id": "#emperor-plot.cwl/out_visualization"
                }, 
                {
                    "inputBinding": {
                        "prefix": "--i-pcoa"
                    }, 
                    "label": "The principal coordinates matrix to be plotted", 
                    "type": "File", 
                    "id": "#emperor-plot.cwl/pcoa"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.out_visualization)"
                    }, 
                    "id": "#emperor-plot.cwl/pcoa_visual"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "emperor", 
                "plot"
            ], 
            "id": "#emperor-plot.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "QIIME2 Step 3", 
            "doc": "QIIME2 Alpha/beta diversity analysis and Alpha rarefaction plotting\n", 
            "inputs": [
                {
                    "type": "int", 
                    "id": "#main/diversity_sampling_depth"
                }, 
                {
                    "type": "int", 
                    "id": "#main/rarefaction_max_depth"
                }, 
                {
                    "type": "File", 
                    "id": "#main/rooted_tree"
                }, 
                {
                    "type": "File", 
                    "id": "#main/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "id": "#main/table"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#main/alpha_rarefaction/alpha_rarefaction_file", 
                    "id": "#main/alpha_rarefaction_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/alpha_beta_diversity/bray_curtis_emperor_file", 
                    "id": "#main/bray_curtis_emperor_file"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#main/alpha_beta_diversity/core_metrics_directory", 
                    "id": "#main/core_metrics_directory"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/alpha_beta_diversity/evenness_group_significance_file", 
                    "id": "#main/evenness_group_significance_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/alpha_beta_diversity/faith_pd_group_significance_file", 
                    "id": "#main/faith_pd_group_significance_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/alpha_beta_diversity/unweighted_unifrac_body_site_significance_file", 
                    "id": "#main/unweighted_unifrac_body_site_significance_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/alpha_beta_diversity/unweighted_unifrac_emperor_file", 
                    "id": "#main/unweighted_unifrac_emperor_file"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/alpha_beta_diversity/unweighted_unifrac_subject_group_significance_file", 
                    "id": "#main/unweighted_unifrac_subject_group_significance_file"
                }
            ], 
            "steps": [
                {
                    "run": "#qiime2-06-alpha-beta-diversity.cwl", 
                    "in": [
                        {
                            "source": "#main/rooted_tree", 
                            "id": "#main/alpha_beta_diversity/rooted_tree"
                        }, 
                        {
                            "source": "#main/sample_metadata", 
                            "id": "#main/alpha_beta_diversity/sample_metadata"
                        }, 
                        {
                            "source": "#main/diversity_sampling_depth", 
                            "id": "#main/alpha_beta_diversity/sampling_depth"
                        }, 
                        {
                            "source": "#main/table", 
                            "id": "#main/alpha_beta_diversity/table"
                        }
                    ], 
                    "out": [
                        "#main/alpha_beta_diversity/core_metrics_directory", 
                        "#main/alpha_beta_diversity/faith_pd_group_significance_file", 
                        "#main/alpha_beta_diversity/evenness_group_significance_file", 
                        "#main/alpha_beta_diversity/unweighted_unifrac_body_site_significance_file", 
                        "#main/alpha_beta_diversity/unweighted_unifrac_subject_group_significance_file", 
                        "#main/alpha_beta_diversity/unweighted_unifrac_emperor_file", 
                        "#main/alpha_beta_diversity/bray_curtis_emperor_file"
                    ], 
                    "id": "#main/alpha_beta_diversity"
                }, 
                {
                    "run": "#qiime2-07-alpha-rarefaction.cwl", 
                    "in": [
                        {
                            "source": "#main/rarefaction_max_depth", 
                            "id": "#main/alpha_rarefaction/max_depth"
                        }, 
                        {
                            "source": "#main/rooted_tree", 
                            "id": "#main/alpha_rarefaction/rooted_tree"
                        }, 
                        {
                            "source": "#main/sample_metadata", 
                            "id": "#main/alpha_rarefaction/sample_metadata"
                        }, 
                        {
                            "source": "#main/table", 
                            "id": "#main/alpha_rarefaction/table"
                        }
                    ], 
                    "out": [
                        "#main/alpha_rarefaction/alpha_rarefaction_file"
                    ], 
                    "id": "#main/alpha_rarefaction"
                }
            ], 
            "id": "#main"
        }
    ]
}