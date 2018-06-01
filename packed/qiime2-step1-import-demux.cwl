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
            "label": "qiime2 importing data", 
            "doc": "Obtaining and importing data from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "File", 
                    "id": "#qiime2-01-import-data.cwl/barcodes"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-01-import-data.cwl/sequences"
                }, 
                {
                    "type": "string", 
                    "default": "emp-single-end-sequences.qza", 
                    "id": "#qiime2-01-import-data.cwl/sequences_artifact_filename"
                }, 
                {
                    "type": "string", 
                    "default": "EMPSingleEndSequences", 
                    "id": "#qiime2-01-import-data.cwl/sequences_artifact_type"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-01-import-data.cwl/make_sequences_artifact/sequences_artifact", 
                    "id": "#qiime2-01-import-data.cwl/sequences_artifact"
                }
            ], 
            "steps": [
                {
                    "run": "#EMPSingleEndSequences-directory.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-01-import-data.cwl/barcodes", 
                            "id": "#qiime2-01-import-data.cwl/make_import_directory/barcodes"
                        }, 
                        {
                            "source": "#qiime2-01-import-data.cwl/sequences", 
                            "id": "#qiime2-01-import-data.cwl/make_import_directory/sequences"
                        }
                    ], 
                    "out": [
                        "#qiime2-01-import-data.cwl/make_import_directory/dir"
                    ], 
                    "id": "#qiime2-01-import-data.cwl/make_import_directory"
                }, 
                {
                    "run": "#tools-import.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-01-import-data.cwl/make_import_directory/dir", 
                            "id": "#qiime2-01-import-data.cwl/make_sequences_artifact/input_path"
                        }, 
                        {
                            "source": "#qiime2-01-import-data.cwl/sequences_artifact_filename", 
                            "id": "#qiime2-01-import-data.cwl/make_sequences_artifact/output_filename"
                        }, 
                        {
                            "source": "#qiime2-01-import-data.cwl/sequences_artifact_type", 
                            "id": "#qiime2-01-import-data.cwl/make_sequences_artifact/type"
                        }
                    ], 
                    "out": [
                        "#qiime2-01-import-data.cwl/make_sequences_artifact/sequences_artifact"
                    ], 
                    "id": "#qiime2-01-import-data.cwl/make_sequences_artifact"
                }
            ], 
            "id": "#qiime2-01-import-data.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "qiime2 demux sequences", 
            "doc": "Demultiplexing sequences from https://docs.qiime2.org/2018.4/tutorials/moving-pictures/", 
            "inputs": [
                {
                    "type": "string", 
                    "default": "demux.qza", 
                    "id": "#qiime2-02-demux.cwl/demux_sequences_filename"
                }, 
                {
                    "type": "string", 
                    "default": "demux.qzv", 
                    "id": "#qiime2-02-demux.cwl/demux_visualization_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#qiime2-02-demux.cwl/metadata_barcodes_column"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-02-demux.cwl/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "id": "#qiime2-02-demux.cwl/sequences_artifact"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qiime2-02-demux.cwl/demux_sequences/demux_sequences_artifact", 
                    "id": "#qiime2-02-demux.cwl/demux_sequences_artifact"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qiime2-02-demux.cwl/demux_visualization/demux_visualization_artifact", 
                    "id": "#qiime2-02-demux.cwl/demux_visualization_artifact"
                }
            ], 
            "steps": [
                {
                    "run": "#demux-emp-single.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-02-demux.cwl/metadata_barcodes_column", 
                            "id": "#qiime2-02-demux.cwl/demux_sequences/barcodes_column"
                        }, 
                        {
                            "source": "#qiime2-02-demux.cwl/sample_metadata", 
                            "id": "#qiime2-02-demux.cwl/demux_sequences/barcodes_file"
                        }, 
                        {
                            "source": "#qiime2-02-demux.cwl/demux_sequences_filename", 
                            "id": "#qiime2-02-demux.cwl/demux_sequences/per_sample_sequences_filename"
                        }, 
                        {
                            "source": "#qiime2-02-demux.cwl/sequences_artifact", 
                            "id": "#qiime2-02-demux.cwl/demux_sequences/seqs"
                        }
                    ], 
                    "out": [
                        "#qiime2-02-demux.cwl/demux_sequences/demux_sequences_artifact"
                    ], 
                    "id": "#qiime2-02-demux.cwl/demux_sequences"
                }, 
                {
                    "run": "#demux-summarize.cwl", 
                    "in": [
                        {
                            "source": "#qiime2-02-demux.cwl/demux_sequences/demux_sequences_artifact", 
                            "id": "#qiime2-02-demux.cwl/demux_visualization/data"
                        }, 
                        {
                            "source": "#qiime2-02-demux.cwl/demux_visualization_filename", 
                            "id": "#qiime2-02-demux.cwl/demux_visualization/visualization_filename"
                        }
                    ], 
                    "out": [
                        "#qiime2-02-demux.cwl/demux_visualization/demux_visualization_artifact"
                    ], 
                    "id": "#qiime2-02-demux.cwl/demux_visualization"
                }
            ], 
            "id": "#qiime2-02-demux.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Creates a directory populated with specifically named files as required by qiime2 EMPSingleEndSequences", 
            "requirements": [
                {
                    "class": "ShellCommandRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "barcode read associated with each sequence", 
                    "id": "#EMPSingleEndSequences-directory.cwl/barcodes"
                }, 
                {
                    "type": "string", 
                    "label": "Name of the resulting directory", 
                    "default": "emp-single-end-sequences", 
                    "id": "#EMPSingleEndSequences-directory.cwl/directory_name"
                }, 
                {
                    "type": "File", 
                    "label": "sequence reads", 
                    "id": "#EMPSingleEndSequences-directory.cwl/sequences"
                }
            ], 
            "arguments": [
                "mkdir", 
                "$(inputs.directory_name)", 
                "&&", 
                "cp", 
                "$(inputs.sequences.path)", 
                "$(inputs.directory_name)/sequences.fastq.gz", 
                "&&", 
                "cp", 
                "$(inputs.barcodes.path)", 
                "$(inputs.directory_name)/barcodes.fastq.gz"
            ], 
            "outputs": [
                {
                    "type": "Directory", 
                    "outputBinding": {
                        "glob": "$(inputs.directory_name)"
                    }, 
                    "id": "#EMPSingleEndSequences-directory.cwl/dir"
                }
            ], 
            "id": "#EMPSingleEndSequences-directory.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Demultiplex sequence data for data generated with the Earth Microbiome Project (EMP) amplicon sequencing protocol", 
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
                    "label": "Column from metadata file or artifact viewable as metadata", 
                    "inputBinding": {
                        "prefix": "--m-barcodes-column"
                    }, 
                    "id": "#demux-emp-single.cwl/barcodes_column"
                }, 
                {
                    "type": "File", 
                    "label": "Metadata file or artifact viewable as metadata", 
                    "inputBinding": {
                        "prefix": "--m-barcodes-file"
                    }, 
                    "id": "#demux-emp-single.cwl/barcodes_file"
                }, 
                {
                    "type": "string", 
                    "label": "Filename for the resulting demultiplexed sequences", 
                    "inputBinding": {
                        "prefix": "--o-per-sample-sequences"
                    }, 
                    "id": "#demux-emp-single.cwl/per_sample_sequences_filename"
                }, 
                {
                    "type": "File", 
                    "label": "qiime2 artifact file with formats (EMPPairedEndSequences | EMPSingleEndSequences | RawSequences)", 
                    "inputBinding": {
                        "prefix": "--i-seqs"
                    }, 
                    "id": "#demux-emp-single.cwl/seqs"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.per_sample_sequences_filename)"
                    }, 
                    "id": "#demux-emp-single.cwl/demux_sequences_artifact"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "demux", 
                "emp-single"
            ], 
            "id": "#demux-emp-single.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Summarize counts per sample for all samples, and generate interactive positional quality plots based on `n` randomly selected sequences", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "de-multiplexed sequences to be summarized", 
                    "inputBinding": {
                        "prefix": "--i-data"
                    }, 
                    "id": "#demux-summarize.cwl/data"
                }, 
                {
                    "type": "string", 
                    "label": "filename for the resulting visualization file", 
                    "inputBinding": {
                        "prefix": "--o-visualization"
                    }, 
                    "id": "#demux-summarize.cwl/visualization_filename"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.visualization_filename)"
                    }, 
                    "id": "#demux-summarize.cwl/demux_visualization_artifact"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "demux", 
                "summarize"
            ], 
            "id": "#demux-summarize.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "qiime2: Import data to create a new QIIME 2 Artifact", 
            "hints": [
                {
                    "$import": "#qiime2-docker-hint.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "Directory", 
                    "label": "path to file or directory that should be imported", 
                    "inputBinding": {
                        "prefix": "--input-path"
                    }, 
                    "id": "#tools-import.cwl/input_path"
                }, 
                {
                    "type": "string", 
                    "label": "filename to use for output file (qza format)", 
                    "inputBinding": {
                        "prefix": "--output-path"
                    }, 
                    "id": "#tools-import.cwl/output_filename"
                }, 
                {
                    "type": "string", 
                    "label": "semantic type of the artifact that will be created upon importing", 
                    "inputBinding": {
                        "prefix": "--type"
                    }, 
                    "id": "#tools-import.cwl/type"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_filename)"
                    }, 
                    "id": "#tools-import.cwl/sequences_artifact"
                }
            ], 
            "baseCommand": [
                "qiime", 
                "tools", 
                "import"
            ], 
            "id": "#tools-import.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "label": "QIIME2 Step 1", 
            "doc": "QIIME2 Import and Demux Step 1\n", 
            "inputs": [
                {
                    "type": "File", 
                    "id": "#main/barcodes"
                }, 
                {
                    "type": "string", 
                    "id": "#main/metadata_barcodes_column"
                }, 
                {
                    "type": "File", 
                    "id": "#main/sample_metadata"
                }, 
                {
                    "type": "File", 
                    "id": "#main/sequences"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#main/demux/demux_sequences_artifact", 
                    "id": "#main/demux_sequences_artifact"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/demux/demux_visualization_artifact", 
                    "id": "#main/demux_visualization_artifact"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/import_data/sequences_artifact", 
                    "id": "#main/sequences_artifact"
                }
            ], 
            "steps": [
                {
                    "run": "#qiime2-02-demux.cwl", 
                    "in": [
                        {
                            "source": "#main/metadata_barcodes_column", 
                            "id": "#main/demux/metadata_barcodes_column"
                        }, 
                        {
                            "source": "#main/sample_metadata", 
                            "id": "#main/demux/sample_metadata"
                        }, 
                        {
                            "source": "#main/import_data/sequences_artifact", 
                            "id": "#main/demux/sequences_artifact"
                        }
                    ], 
                    "out": [
                        "#main/demux/demux_sequences_artifact", 
                        "#main/demux/demux_visualization_artifact"
                    ], 
                    "id": "#main/demux"
                }, 
                {
                    "run": "#qiime2-01-import-data.cwl", 
                    "in": [
                        {
                            "source": "#main/barcodes", 
                            "id": "#main/import_data/barcodes"
                        }, 
                        {
                            "source": "#main/sequences", 
                            "id": "#main/import_data/sequences"
                        }
                    ], 
                    "out": [
                        "#main/import_data/sequences_artifact"
                    ], 
                    "id": "#main/import_data"
                }
            ], 
            "id": "#main"
        }
    ]
}