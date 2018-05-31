{
    "cwlVersion": "v1.0", 
    "$schemas": [
        "https://schema.org/docs/schema_org_rdfa.html"
    ], 
    "$graph": [
        {
            "class": "Workflow", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "id": "#exomeseq-00-prepare-reference-data.cwl/intervals"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "id": "#exomeseq-00-prepare-reference-data.cwl/primary_intervals"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".amb", 
                        ".ann", 
                        ".bwt", 
                        ".pac", 
                        ".sa", 
                        ".fai", 
                        "^.dict"
                    ], 
                    "id": "#exomeseq-00-prepare-reference-data.cwl/reference_genome"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-00-prepare-reference-data.cwl/make_bait_interval_list/output_interval_list_file", 
                    "id": "#exomeseq-00-prepare-reference-data.cwl/bait_interval_list"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-00-prepare-reference-data.cwl/make_target_interval_list/output_interval_list_file", 
                    "id": "#exomeseq-00-prepare-reference-data.cwl/target_interval_list"
                }
            ], 
            "steps": [
                {
                    "run": "#picard-BedToIntervalList.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 1, 
                            "ramMin": 4000, 
                            "outdirMin": 12000, 
                            "tmpdirMin": 12000
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-00-prepare-reference-data.cwl/primary_intervals", 
                            "id": "#exomeseq-00-prepare-reference-data.cwl/make_bait_interval_list/input_file"
                        }, 
                        {
                            "source": "#exomeseq-00-prepare-reference-data.cwl/reference_genome", 
                            "id": "#exomeseq-00-prepare-reference-data.cwl/make_bait_interval_list/reference_sequence"
                        }
                    ], 
                    "out": [
                        "#exomeseq-00-prepare-reference-data.cwl/make_bait_interval_list/output_interval_list_file"
                    ], 
                    "id": "#exomeseq-00-prepare-reference-data.cwl/make_bait_interval_list"
                }, 
                {
                    "run": "#picard-BedToIntervalList.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 1, 
                            "ramMin": 4000, 
                            "outdirMin": 12000, 
                            "tmpdirMin": 12000
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-00-prepare-reference-data.cwl/intervals", 
                            "id": "#exomeseq-00-prepare-reference-data.cwl/make_target_interval_list/input_file"
                        }, 
                        {
                            "source": "#exomeseq-00-prepare-reference-data.cwl/reference_genome", 
                            "id": "#exomeseq-00-prepare-reference-data.cwl/make_target_interval_list/reference_sequence"
                        }
                    ], 
                    "out": [
                        "#exomeseq-00-prepare-reference-data.cwl/make_target_interval_list/output_interval_list_file"
                    ], 
                    "id": "#exomeseq-00-prepare-reference-data.cwl/make_target_interval_list"
                }
            ], 
            "id": "#exomeseq-00-prepare-reference-data.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "SchemaDefRequirement", 
                    "types": [
                        {
                            "name": "#bespin-types.yml/NamedFASTQFilePairType", 
                            "type": "record", 
                            "fields": [
                                {
                                    "name": "#bespin-types.yml/NamedFASTQFilePairType/name", 
                                    "type": "string"
                                }, 
                                {
                                    "name": "#bespin-types.yml/NamedFASTQFilePairType/file1", 
                                    "type": "File"
                                }, 
                                {
                                    "name": "#bespin-types.yml/NamedFASTQFilePairType/file2", 
                                    "type": "File"
                                }
                            ]
                        }, 
                        {
                            "name": "#bespin-types.yml/ExomeseqStudyType", 
                            "type": "enum", 
                            "label": "The type of study", 
                            "symbols": [
                                "#bespin-types.yml/ExomeseqStudyType/Small Familial", 
                                "#bespin-types.yml/ExomeseqStudyType/Large Population"
                            ]
                        }
                    ], 
                    "id": "#bespin-types.yml", 
                    "name": "#bespin-types.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "id": "#exomeseq-01-preprocessing.cwl/GATKJar"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-01-preprocessing.cwl/bait_interval_list"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/interval_padding"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/intervals"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#exomeseq-01-preprocessing.cwl/knownSites"
                }, 
                {
                    "type": "string", 
                    "id": "#exomeseq-01-preprocessing.cwl/library"
                }, 
                {
                    "type": "string", 
                    "id": "#exomeseq-01-preprocessing.cwl/platform"
                }, 
                {
                    "type": "#bespin-types.yml/NamedFASTQFilePairType", 
                    "id": "#exomeseq-01-preprocessing.cwl/read_pair"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-01-preprocessing.cwl/reference_genome"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-01-preprocessing.cwl/resource_dbsnp"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-01-preprocessing.cwl/target_interval_list"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/threads"
                }
            ], 
            "outputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputSource": "#exomeseq-01-preprocessing.cwl/qc/output_qc_report", 
                    "id": "#exomeseq-01-preprocessing.cwl/fastqc_reports"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-01-preprocessing.cwl/variant_calling/output_HaplotypesBam", 
                    "doc": "BAM file containing assembled haplotypes and locally realigned reads", 
                    "id": "#exomeseq-01-preprocessing.cwl/haplotypes_bam"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-01-preprocessing.cwl/collect_hs_metrics/output_hs_metrics_file", 
                    "id": "#exomeseq-01-preprocessing.cwl/hs_metrics"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-01-preprocessing.cwl/mark_duplicates/output_dedup_bam_file", 
                    "id": "#exomeseq-01-preprocessing.cwl/markduplicates_bam"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-01-preprocessing.cwl/variant_calling/output_HaplotypeCaller", 
                    "doc": "VCF file from per sample variant calling", 
                    "id": "#exomeseq-01-preprocessing.cwl/raw_variants"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/output_printReads", 
                    "id": "#exomeseq-01-preprocessing.cwl/recalibrated_reads"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/output_baseRecalibrator", 
                    "id": "#exomeseq-01-preprocessing.cwl/recalibration_table"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputSource": "#exomeseq-01-preprocessing.cwl/trim/trim_reports", 
                    "id": "#exomeseq-01-preprocessing.cwl/trim_reports"
                }
            ], 
            "steps": [
                {
                    "run": "#picard-CollectHsMetrics.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 1, 
                            "ramMin": 4000, 
                            "outdirMin": 12000, 
                            "tmpdirMin": 12000
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/bait_interval_list", 
                            "id": "#exomeseq-01-preprocessing.cwl/collect_hs_metrics/bait_intervals"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/mark_duplicates/output_dedup_bam_file", 
                            "id": "#exomeseq-01-preprocessing.cwl/collect_hs_metrics/input_file"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/hs_metrics_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/collect_hs_metrics/output_filename"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/reference_genome", 
                            "id": "#exomeseq-01-preprocessing.cwl/collect_hs_metrics/reference_sequence"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/target_interval_list", 
                            "id": "#exomeseq-01-preprocessing.cwl/collect_hs_metrics/target_intervals"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/collect_hs_metrics/output_hs_metrics_file"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/collect_hs_metrics"
                }, 
                {
                    "run": "#extract-named-file-pair-details.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/library", 
                            "id": "#exomeseq-01-preprocessing.cwl/file_pair_details/library"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/platform", 
                            "id": "#exomeseq-01-preprocessing.cwl/file_pair_details/platform"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/read_pair", 
                            "id": "#exomeseq-01-preprocessing.cwl/file_pair_details/read_pair"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/file_pair_details/reads", 
                        "#exomeseq-01-preprocessing.cwl/file_pair_details/read_pair_name", 
                        "#exomeseq-01-preprocessing.cwl/file_pair_details/read_group_header"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/file_pair_details"
                }, 
                {
                    "run": "#generate-sample-filenames.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/file_pair_details/read_pair_name", 
                            "id": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/sample_name"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/mapped_reads_output_filename", 
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/sorted_reads_output_filename", 
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/dedup_reads_output_filename", 
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/dedup_metrics_output_filename", 
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/recal_reads_output_filename", 
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/recal_table_output_filename", 
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/raw_variants_output_filename", 
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/haplotypes_bam_output_filename", 
                        "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/hs_metrics_output_filename"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames"
                }, 
                {
                    "run": "#bwa-mem-samtools.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 8, 
                            "ramMin": 16000, 
                            "outdirMin": 12000, 
                            "tmpdirMin": 12000
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/mapped_reads_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/map/output_filename"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/file_pair_details/read_group_header", 
                            "id": "#exomeseq-01-preprocessing.cwl/map/read_group_header"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/trim/trimmed_reads", 
                            "id": "#exomeseq-01-preprocessing.cwl/map/reads"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/reference_genome", 
                            "id": "#exomeseq-01-preprocessing.cwl/map/reference"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/threads", 
                            "id": "#exomeseq-01-preprocessing.cwl/map/threads"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/map/output"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/map"
                }, 
                {
                    "run": "#picard-MarkDuplicates.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 1, 
                            "ramMin": 4000, 
                            "outdirMin": 12000, 
                            "tmpdirMin": 12000
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/sort/sorted", 
                            "id": "#exomeseq-01-preprocessing.cwl/mark_duplicates/input_file"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/dedup_metrics_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/mark_duplicates/metrics_filename"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/dedup_reads_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/mark_duplicates/output_filename"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/mark_duplicates/output_dedup_bam_file", 
                        "#exomeseq-01-preprocessing.cwl/mark_duplicates/output_metrics_file"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/mark_duplicates"
                }, 
                {
                    "run": "#fastqc.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 4, 
                            "ramMin": 2500
                        }
                    ], 
                    "scatter": "#exomeseq-01-preprocessing.cwl/qc/input_fastq_file", 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/file_pair_details/reads", 
                            "id": "#exomeseq-01-preprocessing.cwl/qc/input_fastq_file"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/threads", 
                            "id": "#exomeseq-01-preprocessing.cwl/qc/threads"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/qc/output_qc_report"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/qc"
                }, 
                {
                    "run": "#GATK-BaseRecalibrator.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 8, 
                            "ramMin": 4096
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/GATKJar", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/GATKJar"
                        }, 
                        {
                            "default": 8, 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/cpu_threads"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/mark_duplicates/output_dedup_bam_file", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/inputBam_BaseRecalibrator"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/interval_padding", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/interval_padding"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/intervals", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/intervals"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/knownSites", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/knownSites"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/recal_table_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/outputfile_BaseRecalibrator"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/reference_genome", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/reference"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/output_baseRecalibrator"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze"
                }, 
                {
                    "run": "#GATK-PrintReads.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 8, 
                            "ramMin": 4096
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/GATKJar", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/GATKJar"
                        }, 
                        {
                            "default": 8, 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/cpu_threads"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/mark_duplicates/output_dedup_bam_file", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/inputBam_printReads"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/recalibrate_01_analyze/output_baseRecalibrator", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/input_baseRecalibrator"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/intervals", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/intervals"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/recal_reads_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/outputfile_printReads"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/reference_genome", 
                            "id": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/reference"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/output_printReads"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply"
                }, 
                {
                    "run": "#picard-SortSam.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 1, 
                            "ramMin": 4000, 
                            "outdirMin": 12000, 
                            "tmpdirMin": 12000
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/map/output", 
                            "id": "#exomeseq-01-preprocessing.cwl/sort/input_file"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/sorted_reads_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/sort/output_filename"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/sort/sorted"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/sort"
                }, 
                {
                    "run": "#trim_galore.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 4, 
                            "ramMin": 8000
                        }
                    ], 
                    "in": [
                        {
                            "default": true, 
                            "id": "#exomeseq-01-preprocessing.cwl/trim/paired"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/file_pair_details/reads", 
                            "id": "#exomeseq-01-preprocessing.cwl/trim/reads"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/trim/trimmed_reads", 
                        "#exomeseq-01-preprocessing.cwl/trim/trim_reports"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/trim"
                }, 
                {
                    "run": "#GATK-HaplotypeCaller.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 1, 
                            "ramMin": 16384
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/GATKJar", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/GATKJar"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/haplotypes_bam_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/bamOutput"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/resource_dbsnp", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/dbsnp"
                        }, 
                        {
                            "default": "GVCF", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/emitRefConfidence"
                        }, 
                        {
                            "default": [
                                "StandardAnnotation", 
                                "AS_StandardAnnotation"
                            ], 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/group"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/recalibrate_02_apply/output_printReads", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/inputBam_HaplotypeCaller"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/interval_padding", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/interval_padding"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/intervals", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/intervals"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/generate_sample_filenames/raw_variants_output_filename", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/outputfile_HaplotypeCaller"
                        }, 
                        {
                            "source": "#exomeseq-01-preprocessing.cwl/reference_genome", 
                            "id": "#exomeseq-01-preprocessing.cwl/variant_calling/reference"
                        }
                    ], 
                    "out": [
                        "#exomeseq-01-preprocessing.cwl/variant_calling/output_HaplotypeCaller", 
                        "#exomeseq-01-preprocessing.cwl/variant_calling/output_HaplotypesBam"
                    ], 
                    "id": "#exomeseq-01-preprocessing.cwl/variant_calling"
                }
            ], 
            "id": "#exomeseq-01-preprocessing.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "$import": "#bespin-types.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/GATKJar"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/indel_resource_mills"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/interval_padding"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/intervals"
                }, 
                {
                    "type": "string", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/name"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#exomeseq-02-variantdiscovery.cwl/raw_variants"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/reference_genome"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/resource_dbsnp"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/snp_resource_1kg"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/snp_resource_hapmap"
                }, 
                {
                    "type": "File", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/snp_resource_omni"
                }, 
                {
                    "type": "#bespin-types.yml/ExomeseqStudyType", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/study_type"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/threads"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/output_GenotypeGVCFs", 
                    "doc": "VCF file from joint genotyping calling", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/joint_raw_variants"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/recal_File", 
                    "doc": "The output recal file used by ApplyRecalibration in INDEL mode", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps_indels_recal"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/vqsr_rscript", 
                    "doc": "The output rscript file generated by the VQSR in INDEL mode to aid in visualization of the input data and learned model", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps_indels_rscript"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/tranches_File", 
                    "doc": "The output tranches file used by ApplyRecalibration in INDEL mode", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps_indels_tranches"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/output_recalibrated_vcf", 
                    "doc": "The output filtered and recalibrated VCF file in in which each variant is annotated with its VQSLOD value", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps_indels_vcf"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/recal_File", 
                    "doc": "The output recal file used by ApplyRecalibration in SNP mode", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps_recal"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/vqsr_rscript", 
                    "doc": "The output rscript file generated by the VQSR in SNP mode to aid in visualization of the input data and learned model", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps_rscript"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/tranches_File", 
                    "doc": "The output tranches file used by ApplyRecalibration in SNP mode", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps_tranches"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/output_recalibrated_vcf", 
                    "doc": "The output filtered and recalibrated VCF file in SNP mode in which each variant is annotated with its VQSLOD value", 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps_vcf"
                }
            ], 
            "steps": [
                {
                    "run": "#GATK-ApplyRecalibration.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/GATKJar", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/GATKJar"
                        }, 
                        {
                            "default": "INDEL", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/mode"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_indels_recalibrated_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/outputfile_recalibrated_vcf"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/recal_File", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/recal_file"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/reference_genome", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/reference"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/threads", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/threads"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/tranches_File", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/tranches_file"
                        }, 
                        {
                            "default": 99.0, 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/ts_filter_level"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/output_recalibrated_vcf", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/variants"
                        }
                    ], 
                    "out": [
                        "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels/output_recalibrated_vcf"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_indels"
                }, 
                {
                    "run": "#GATK-ApplyRecalibration.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/GATKJar", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/GATKJar"
                        }, 
                        {
                            "default": "SNP", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/mode"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_recalibrated_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/outputfile_recalibrated_vcf"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/recal_File", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/recal_file"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/reference_genome", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/reference"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/threads", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/threads"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/tranches_File", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/tranches_file"
                        }, 
                        {
                            "default": 99.0, 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/ts_filter_level"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/output_GenotypeGVCFs", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/variants"
                        }
                    ], 
                    "out": [
                        "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/output_recalibrated_vcf"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps"
                }, 
                {
                    "run": "#generate-variant-recalibration-annotation-set.cwl", 
                    "in": [
                        {
                            "default": [
                                "QD", 
                                "FS", 
                                "MQ", 
                                "MQRankSum", 
                                "ReadPosRankSum"
                            ], 
                            "id": "#exomeseq-02-variantdiscovery.cwl/generate_annotations_indels/base_annotations"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/study_type", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/generate_annotations_indels/study_type"
                        }
                    ], 
                    "out": [
                        "#exomeseq-02-variantdiscovery.cwl/generate_annotations_indels/annotations"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/generate_annotations_indels"
                }, 
                {
                    "run": "#generate-variant-recalibration-annotation-set.cwl", 
                    "in": [
                        {
                            "default": [
                                "QD", 
                                "FS", 
                                "MQ", 
                                "SOR", 
                                "MQRankSum", 
                                "ReadPosRankSum"
                            ], 
                            "id": "#exomeseq-02-variantdiscovery.cwl/generate_annotations_snps/base_annotations"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/study_type", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/generate_annotations_snps/study_type"
                        }
                    ], 
                    "out": [
                        "#exomeseq-02-variantdiscovery.cwl/generate_annotations_snps/annotations"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/generate_annotations_snps"
                }, 
                {
                    "run": "#generate-joint-filenames.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/name", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/name"
                        }
                    ], 
                    "out": [
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/joint_genotype_raw_variants_output_filename", 
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_vqsr_recal_output_filename", 
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_vqsr_tranches_output_filename", 
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_vqsr_rscript_output_filename", 
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_recalibrated_output_filename", 
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_indels_vqsr_recal_output_filename", 
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_indels_vqsr_tranches_output_filename", 
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_indels_vqsr_rscript_output_filename", 
                        "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_indels_recalibrated_output_filename"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames"
                }, 
                {
                    "run": "#GATK-GenotypeGVCFs.cwl", 
                    "requirements": [
                        {
                            "class": "ResourceRequirement", 
                            "coresMin": 1, 
                            "ramMin": 12288
                        }
                    ], 
                    "in": [
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/GATKJar", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/GATKJar"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/resource_dbsnp", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/dbsnp"
                        }, 
                        {
                            "default": [
                                "StandardAnnotation"
                            ], 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/group"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/interval_padding", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/interval_padding"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/intervals", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/intervals"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/joint_genotype_raw_variants_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/outputfile_GenotypeGVCFs"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/reference_genome", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/reference"
                        }, 
                        {
                            "default": 1, 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/threads"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/raw_variants", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/variants"
                        }
                    ], 
                    "out": [
                        "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/output_GenotypeGVCFs"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping"
                }, 
                {
                    "run": "#GATK-VariantRecalibrator-Indels.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/GATKJar", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/GATKJar"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_annotations_indels/annotations", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/annotations"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_indels_vqsr_recal_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/outputfile_recal"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_indels_vqsr_rscript_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/outputfile_rscript"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_indels_vqsr_tranches_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/outputfile_tranches"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/reference_genome", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/reference"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/resource_dbsnp", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/resource_dbsnp"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/indel_resource_mills", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/resource_mills"
                        }, 
                        {
                            "default": 1, 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/threads"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/apply_recalibration_snps/output_recalibrated_vcf", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/variants"
                        }
                    ], 
                    "out": [
                        "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/tranches_File", 
                        "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/recal_File", 
                        "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels/vqsr_rscript"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_indels"
                }, 
                {
                    "run": "#GATK-VariantRecalibrator-SNPs.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/GATKJar", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/GATKJar"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_annotations_snps/annotations", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/annotations"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_vqsr_recal_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/outputfile_recal"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_vqsr_rscript_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/outputfile_rscript"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/generate_joint_filenames/snps_vqsr_tranches_output_filename", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/outputfile_tranches"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/reference_genome", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/reference"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/snp_resource_1kg", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/resource_1kg"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/resource_dbsnp", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/resource_dbsnp"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/snp_resource_hapmap", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/resource_hapmap"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/snp_resource_omni", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/resource_omni"
                        }, 
                        {
                            "default": 1, 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/threads"
                        }, 
                        {
                            "source": "#exomeseq-02-variantdiscovery.cwl/joint_genotyping/output_GenotypeGVCFs", 
                            "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/variants"
                        }
                    ], 
                    "out": [
                        "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/tranches_File", 
                        "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/recal_File", 
                        "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps/vqsr_rscript"
                    ], 
                    "id": "#exomeseq-02-variantdiscovery.cwl/variant_recalibration_snps"
                }
            ], 
            "id": "#exomeseq-02-variantdiscovery.cwl"
        }, 
        {
            "class": "Workflow", 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#exomeseq-03-organizedirectories.cwl/bams_final"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#exomeseq-03-organizedirectories.cwl/bams_markduplicates"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": {
                            "type": "array", 
                            "items": "File"
                        }
                    }, 
                    "id": "#exomeseq-03-organizedirectories.cwl/fastqc_reports"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#exomeseq-03-organizedirectories.cwl/hs_metrics"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#exomeseq-03-organizedirectories.cwl/raw_variants"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": {
                            "type": "array", 
                            "items": "File"
                        }
                    }, 
                    "id": "#exomeseq-03-organizedirectories.cwl/trim_reports"
                }
            ], 
            "outputs": [
                {
                    "type": "Directory", 
                    "outputSource": "#exomeseq-03-organizedirectories.cwl/org_bams_final/outdir", 
                    "id": "#exomeseq-03-organizedirectories.cwl/bams_final_dir"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#exomeseq-03-organizedirectories.cwl/org_bams_markduplicates/outdir", 
                    "id": "#exomeseq-03-organizedirectories.cwl/bams_markduplicates_dir"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#exomeseq-03-organizedirectories.cwl/org_fastqc_reports/outdir", 
                    "id": "#exomeseq-03-organizedirectories.cwl/fastqc_reports_dir"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#exomeseq-03-organizedirectories.cwl/org_hs_metrics/outdir", 
                    "id": "#exomeseq-03-organizedirectories.cwl/hs_metrics_dir"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#exomeseq-03-organizedirectories.cwl/org_raw_variants/outdir", 
                    "id": "#exomeseq-03-organizedirectories.cwl/raw_variants_dir"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#exomeseq-03-organizedirectories.cwl/org_trim_reports/outdir", 
                    "id": "#exomeseq-03-organizedirectories.cwl/trim_reports_dir"
                }
            ], 
            "steps": [
                {
                    "run": "#files-to-directory.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-03-organizedirectories.cwl/bams_final", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_bams_final/files"
                        }, 
                        {
                            "default": "bams-final", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_bams_final/name"
                        }
                    ], 
                    "out": [
                        "#exomeseq-03-organizedirectories.cwl/org_bams_final/outdir"
                    ], 
                    "id": "#exomeseq-03-organizedirectories.cwl/org_bams_final"
                }, 
                {
                    "run": "#files-to-directory.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-03-organizedirectories.cwl/bams_markduplicates", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_bams_markduplicates/files"
                        }, 
                        {
                            "default": "bams-markduplicates", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_bams_markduplicates/name"
                        }
                    ], 
                    "out": [
                        "#exomeseq-03-organizedirectories.cwl/org_bams_markduplicates/outdir"
                    ], 
                    "id": "#exomeseq-03-organizedirectories.cwl/org_bams_markduplicates"
                }, 
                {
                    "run": "#file-pairs-to-directory.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-03-organizedirectories.cwl/fastqc_reports", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_fastqc_reports/file_pairs"
                        }, 
                        {
                            "default": "fastqc-reports", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_fastqc_reports/name"
                        }
                    ], 
                    "out": [
                        "#exomeseq-03-organizedirectories.cwl/org_fastqc_reports/outdir"
                    ], 
                    "id": "#exomeseq-03-organizedirectories.cwl/org_fastqc_reports"
                }, 
                {
                    "run": "#files-to-directory.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-03-organizedirectories.cwl/hs_metrics", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_hs_metrics/files"
                        }, 
                        {
                            "default": "hs-metrics", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_hs_metrics/name"
                        }
                    ], 
                    "out": [
                        "#exomeseq-03-organizedirectories.cwl/org_hs_metrics/outdir"
                    ], 
                    "id": "#exomeseq-03-organizedirectories.cwl/org_hs_metrics"
                }, 
                {
                    "run": "#files-to-directory.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-03-organizedirectories.cwl/raw_variants", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_raw_variants/files"
                        }, 
                        {
                            "default": "gvcfs", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_raw_variants/name"
                        }
                    ], 
                    "out": [
                        "#exomeseq-03-organizedirectories.cwl/org_raw_variants/outdir"
                    ], 
                    "id": "#exomeseq-03-organizedirectories.cwl/org_raw_variants"
                }, 
                {
                    "run": "#file-pairs-to-directory.cwl", 
                    "in": [
                        {
                            "source": "#exomeseq-03-organizedirectories.cwl/trim_reports", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_trim_reports/file_pairs"
                        }, 
                        {
                            "default": "trim-reports", 
                            "id": "#exomeseq-03-organizedirectories.cwl/org_trim_reports/name"
                        }
                    ], 
                    "out": [
                        "#exomeseq-03-organizedirectories.cwl/org_trim_reports/outdir"
                    ], 
                    "id": "#exomeseq-03-organizedirectories.cwl/org_trim_reports"
                }
            ], 
            "id": "#exomeseq-03-organizedirectories.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "class": "EnvVarRequirement", 
                    "envDef": [
                        {
                            "envName": "PATH", 
                            "envValue": "/usr/local/bin/:/usr/bin:/bin"
                        }
                    ], 
                    "id": "#envvar-global.yml", 
                    "name": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/gatk-base:3"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "3.8"
                            ], 
                            "package": "gatk", 
                            "https://schema.org/citation": "https://dx.doi.org/10.1038/ng.806"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-jar"
                    }, 
                    "id": "#GATK-ApplyRecalibration.cwl/GATKJar"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--intervals"
                    }, 
                    "doc": "One or more genomic intervals over which to operate", 
                    "id": "#GATK-ApplyRecalibration.cwl/intervals"
                }, 
                {
                    "type": "string", 
                    "default": "-Xmx8g", 
                    "inputBinding": {
                        "position": 0
                    }, 
                    "id": "#GATK-ApplyRecalibration.cwl/java_mem"
                }, 
                {
                    "type": "string", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-mode"
                    }, 
                    "doc": "specify if VQSR is called on SNPs or Indels", 
                    "id": "#GATK-ApplyRecalibration.cwl/mode"
                }, 
                {
                    "type": "string", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-o"
                    }, 
                    "id": "#GATK-ApplyRecalibration.cwl/outputfile_recalibrated_vcf"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-recalFile"
                    }, 
                    "doc": "the recal file generated by VariantRecalibrator", 
                    "id": "#GATK-ApplyRecalibration.cwl/recal_file"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".fai", 
                        "^.dict"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-R"
                    }, 
                    "doc": "reference genome", 
                    "id": "#GATK-ApplyRecalibration.cwl/reference"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-nt"
                    }, 
                    "doc": "multithreading option", 
                    "id": "#GATK-ApplyRecalibration.cwl/threads"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-tranchesFile"
                    }, 
                    "doc": "the tranches file generated by VariantRecalibrator", 
                    "id": "#GATK-ApplyRecalibration.cwl/tranches_file"
                }, 
                {
                    "type": "float", 
                    "default": 99.9, 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--ts_filter_level"
                    }, 
                    "doc": "filtering level default value is 99.9", 
                    "id": "#GATK-ApplyRecalibration.cwl/ts_filter_level"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-input"
                    }, 
                    "doc": "The raw input variants to be recalibrated", 
                    "id": "#GATK-ApplyRecalibration.cwl/variants"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_recalibrated_vcf)"
                    }, 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "doc": "The output recalibration VCF file", 
                    "id": "#GATK-ApplyRecalibration.cwl/output_recalibrated_vcf"
                }
            ], 
            "arguments": [
                {
                    "valueFrom": "$(runtime.tmpdir)", 
                    "position": 0, 
                    "separate": false, 
                    "prefix": "-Djava.io.tmpdir="
                }, 
                {
                    "valueFrom": "ApplyRecalibration", 
                    "position": 2, 
                    "prefix": "-T"
                }
            ], 
            "baseCommand": [
                "java"
            ], 
            "id": "#GATK-ApplyRecalibration.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "$import": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/gatk-base:3"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "3.8"
                            ], 
                            "package": "gatk", 
                            "https://schema.org/citation": "https://dx.doi.org/10.1038/ng.806"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-jar"
                    }, 
                    "id": "#GATK-BaseRecalibrator.cwl/GATKJar"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--binary_tag_name"
                    }, 
                    "doc": "the binary tag covariate name if using it", 
                    "id": "#GATK-BaseRecalibrator.cwl/binary_tag_name"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--BQSR"
                    }, 
                    "doc": "Input covariates table file for on-the-fly base quality score recalibration", 
                    "id": "#GATK-BaseRecalibrator.cwl/bqsr"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--bqsrBAQGapOpenPenalty"
                    }, 
                    "doc": "BQSR BAQ gap open penalty (Phred Scaled). Default value is 40. 30 is perhaps better for whole genome call sets", 
                    "id": "#GATK-BaseRecalibrator.cwl/bqsrBAQGapOpenPenalty"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--covariate"
                    }, 
                    "doc": "One or more covariates to be used in the recalibration. Can be specified multiple times", 
                    "id": "#GATK-BaseRecalibrator.cwl/covariate"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "controls the number of CPU threads allocated to each data thread", 
                    "default": 8, 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-nct"
                    }, 
                    "id": "#GATK-BaseRecalibrator.cwl/cpu_threads"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--deletions_default_quality"
                    }, 
                    "doc": "default quality for the base deletions covariate", 
                    "id": "#GATK-BaseRecalibrator.cwl/deletions_default_quality"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--indels_context_size"
                    }, 
                    "doc": "Size of the k-mer context to be used for base insertions and deletions", 
                    "id": "#GATK-BaseRecalibrator.cwl/indels_context_size"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-I"
                    }, 
                    "secondaryFiles": [
                        "^.bai"
                    ], 
                    "doc": "bam file produced after indelRealigner", 
                    "id": "#GATK-BaseRecalibrator.cwl/inputBam_BaseRecalibrator"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--insertions_default_quality"
                    }, 
                    "doc": "default quality for the base insertions covariate", 
                    "id": "#GATK-BaseRecalibrator.cwl/insertions_default_quality"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--interval_padding"
                    }, 
                    "doc": "Amount of padding (in bp) to add to each interval", 
                    "id": "#GATK-BaseRecalibrator.cwl/interval_padding"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File", 
                            "inputBinding": {
                                "prefix": "--intervals"
                            }
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "One or more genomic intervals over which to operate", 
                    "id": "#GATK-BaseRecalibrator.cwl/intervals"
                }, 
                {
                    "type": "string", 
                    "default": "-Xmx4g", 
                    "inputBinding": {
                        "position": 0
                    }, 
                    "id": "#GATK-BaseRecalibrator.cwl/java_arg"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File", 
                            "inputBinding": {
                                "prefix": "--knownSites"
                            }
                        }
                    ], 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "Any number of VCF files representing known SNPs and/or indels. Could be e.g. dbSNP and/or official 1000 Genomes indel calls. SNPs in these files will be ignored unless the --mismatchFraction argument is used. optional parameter.", 
                    "id": "#GATK-BaseRecalibrator.cwl/knownSites"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--list"
                    }, 
                    "doc": "List the available covariates and exit", 
                    "id": "#GATK-BaseRecalibrator.cwl/list"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--lowMemoryMode"
                    }, 
                    "doc": "Reduce memory usage in multi-threaded code at the expense of threading efficiency", 
                    "id": "#GATK-BaseRecalibrator.cwl/lowMemoryMode"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--low_quality_tail"
                    }, 
                    "doc": "minimum quality for the bases in the tail of the reads to be considered", 
                    "id": "#GATK-BaseRecalibrator.cwl/low_quality_tail"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--maximum_cycle_value"
                    }, 
                    "doc": "The maximum cycle value permitted for the Cycle covariate", 
                    "id": "#GATK-BaseRecalibrator.cwl/maximum_cycle_value"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--mismatches_context_size"
                    }, 
                    "doc": "Size of the k-mer context to be used for base mismatches", 
                    "id": "#GATK-BaseRecalibrator.cwl/mismatches_context_size"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--mismatches_default_quality"
                    }, 
                    "doc": "default quality for the base mismatches covariate", 
                    "id": "#GATK-BaseRecalibrator.cwl/mismatches_default_quality"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--no_standard_covs"
                    }, 
                    "doc": "Do not use the standard set of covariates, but rather just the ones listed using the -cov argument", 
                    "id": "#GATK-BaseRecalibrator.cwl/no_standard_covs"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--out"
                    }, 
                    "doc": "The output recalibration table file to create", 
                    "id": "#GATK-BaseRecalibrator.cwl/out"
                }, 
                {
                    "type": "string", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-o"
                    }, 
                    "doc": "name of the output file from baseRecalibrator", 
                    "id": "#GATK-BaseRecalibrator.cwl/outputfile_BaseRecalibrator"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--quantizing_levels"
                    }, 
                    "doc": "Sort the rows in the tables of reports. Whether GATK report tables should have rows in sorted order, starting from leftmost column", 
                    "id": "#GATK-BaseRecalibrator.cwl/quantizing_levels"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-R"
                    }, 
                    "secondaryFiles": [
                        ".amb", 
                        ".ann", 
                        ".bwt", 
                        ".pac", 
                        ".sa", 
                        ".fai", 
                        "^.dict"
                    ], 
                    "id": "#GATK-BaseRecalibrator.cwl/reference"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--run_without_dbsnp_potentially_ruining_quality"
                    }, 
                    "doc": "If specified, allows the recalibrator to be used without a dbsnp rod. Very unsafe and for expert users only.", 
                    "id": "#GATK-BaseRecalibrator.cwl/run_without_dbsnp_potentially_ruining_quality"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--solid_nocall_strategy"
                    }, 
                    "doc": "Defines the behavior of the recalibrator when it encounters no calls in the color space. Options = THROW_EXCEPTION, LEAVE_READ_UNRECALIBRATED, or PURGE_READ", 
                    "id": "#GATK-BaseRecalibrator.cwl/solid_nocall_strategy"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--solid_recal_mode"
                    }, 
                    "doc": "How should we recalibrate solid bases in which the reference was inserted? Options = DO_NOTHING, SET_Q_ZERO, SET_Q_ZERO_BASE_N, or REMOVE_REF_BIAS", 
                    "id": "#GATK-BaseRecalibrator.cwl/solid_recal_mode"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--sort_by_all_columns"
                    }, 
                    "doc": "Sort the rows in the tables of reports. Whether GATK report tables should have rows in sorted order, starting from leftmost column", 
                    "id": "#GATK-BaseRecalibrator.cwl/sort_by_all_columns"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_BaseRecalibrator)"
                    }, 
                    "id": "#GATK-BaseRecalibrator.cwl/output_baseRecalibrator"
                }
            ], 
            "arguments": [
                {
                    "valueFrom": "$(runtime.tmpdir)", 
                    "position": 0, 
                    "separate": false, 
                    "prefix": "-Djava.io.tmpdir="
                }, 
                {
                    "valueFrom": "BaseRecalibrator", 
                    "position": 2, 
                    "prefix": "-T"
                }
            ], 
            "baseCommand": [
                "java"
            ], 
            "doc": "GATK-BaseRecalibrator.cwl is developed for CWL consortium\nIt generate base recalibration table to compensate for systematic errors in basecalling confidences\n  Usage: java -jar GenomeAnalysisTK.jar -T BaseRecalibrator -R reference.fasta -I my_reads.bam -knownSites latest_dbsnp.vcf -o recal_data.table.\n", 
            "id": "#GATK-BaseRecalibrator.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "$import": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/gatk-base:3"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "3.8"
                            ], 
                            "package": "gatk", 
                            "https://schema.org/citation": "https://dx.doi.org/10.1038/ng.806"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-jar"
                    }, 
                    "id": "#GATK-GenotypeGVCFs.cwl/GATKJar"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--annotateNDA"
                    }, 
                    "doc": "If provided, we will annotate records with the number of alternate alleles that were discovered (but not necessarily genotyped) at a given site", 
                    "id": "#GATK-GenotypeGVCFs.cwl/annotateNDA"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "string"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--annotation"
                    }, 
                    "doc": "One or more specific annotations to apply to variant calls", 
                    "id": "#GATK-GenotypeGVCFs.cwl/annotation"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--dbsnp"
                    }, 
                    "doc": "latest_dbsnp.vcf set of known indels", 
                    "id": "#GATK-GenotypeGVCFs.cwl/dbsnp"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "string"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--group"
                    }, 
                    "doc": "One or more classes/groups of annotations to apply to variant calls", 
                    "id": "#GATK-GenotypeGVCFs.cwl/group"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--heterozygosity"
                    }, 
                    "doc": "Heterozygosity for indel calling", 
                    "id": "#GATK-GenotypeGVCFs.cwl/heterozygosity"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--heterozygosity_stdev"
                    }, 
                    "doc": "Heterozygosity for indel calling", 
                    "id": "#GATK-GenotypeGVCFs.cwl/heterozygosity_stdev"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--includeNonVariantSites"
                    }, 
                    "doc": "Include loci found to be non-variant after genotyping", 
                    "id": "#GATK-GenotypeGVCFs.cwl/includeNonVariantSites"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--indel_heterozygosity"
                    }, 
                    "doc": "Heterozygosity for indel calling", 
                    "id": "#GATK-GenotypeGVCFs.cwl/indel_heterozygosity"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "double"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--input_prior"
                    }, 
                    "doc": "Input prior for calls", 
                    "id": "#GATK-GenotypeGVCFs.cwl/input_prior"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--interval_padding"
                    }, 
                    "doc": "Amount of padding (in bp) to add to each interval", 
                    "id": "#GATK-GenotypeGVCFs.cwl/interval_padding"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--intervals"
                    }, 
                    "doc": "One or more genomic intervals over which to operate", 
                    "id": "#GATK-GenotypeGVCFs.cwl/intervals"
                }, 
                {
                    "type": "string", 
                    "default": "-Xmx4g", 
                    "inputBinding": {
                        "position": 0
                    }, 
                    "id": "#GATK-GenotypeGVCFs.cwl/java_arg"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--max_alternate_alleles"
                    }, 
                    "doc": "Maximum number of alternate alleles to genotype", 
                    "id": "#GATK-GenotypeGVCFs.cwl/max_alternate_alleles"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--max_genotype_count"
                    }, 
                    "doc": "Maximum number of genotypes to consider at any site", 
                    "id": "#GATK-GenotypeGVCFs.cwl/max_genotype_count"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--max_num_PL_values"
                    }, 
                    "doc": "Maximum number of PL values to output", 
                    "id": "#GATK-GenotypeGVCFs.cwl/max_num_PL_values"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-o"
                    }, 
                    "doc": "name of the output file from GenotypeGVCFs", 
                    "id": "#GATK-GenotypeGVCFs.cwl/outputfile_GenotypeGVCFs"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-R"
                    }, 
                    "secondaryFiles": [
                        ".amb", 
                        ".ann", 
                        ".bwt", 
                        ".pac", 
                        ".sa", 
                        ".fai", 
                        "^.dict"
                    ], 
                    "doc": "Reference genome assembly, indexed", 
                    "id": "#GATK-GenotypeGVCFs.cwl/reference"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--sample_ploidy"
                    }, 
                    "doc": "Use additional trigger on variants found in an external alleles file", 
                    "id": "#GATK-GenotypeGVCFs.cwl/sample_ploidy"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--standard_min_confidence_threshold_for_calling"
                    }, 
                    "doc": "The minimum phred-scaled confidence threshold at which variants should be called", 
                    "id": "#GATK-GenotypeGVCFs.cwl/stand_call_conf"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-nt"
                    }, 
                    "doc": "Number of data threads to allocate to this analysis", 
                    "id": "#GATK-GenotypeGVCFs.cwl/threads"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--useNewAFCalculator"
                    }, 
                    "doc": "Use new AF model instead of the so-called exact model", 
                    "id": "#GATK-GenotypeGVCFs.cwl/useNewAFCalculator"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File", 
                        "inputBinding": {
                            "prefix": "-V"
                        }
                    }, 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "One or more input gVCF files", 
                    "id": "#GATK-GenotypeGVCFs.cwl/variants"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_GenotypeGVCFs)"
                    }, 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "id": "#GATK-GenotypeGVCFs.cwl/output_GenotypeGVCFs"
                }
            ], 
            "arguments": [
                {
                    "valueFrom": "$(runtime.tmpdir)", 
                    "position": 0, 
                    "separate": false, 
                    "prefix": "-Djava.io.tmpdir="
                }, 
                {
                    "valueFrom": "GenotypeGVCFs", 
                    "position": 2, 
                    "prefix": "-T"
                }
            ], 
            "baseCommand": [
                "java"
            ], 
            "doc": "GATK-GenotypeGVCFs.cwl is developed for CWL consortium\nPerform joint genotyping on gVCF files produced by HaplotypeCaller\n", 
            "id": "#GATK-GenotypeGVCFs.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "$import": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/gatk-base:3"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "3.8"
                            ], 
                            "package": "gatk", 
                            "https://schema.org/citation": "https://dx.doi.org/10.1038/ng.806"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--indelSizeToEliminateInRefModel"
                    }, 
                    "doc": "The size of an indel to check for in the reference model", 
                    "id": "#GATK-HaplotypeCaller.cwl/ERCIS"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-jar"
                    }, 
                    "id": "#GATK-HaplotypeCaller.cwl/GATKJar"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "int"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "Input prior for calls", 
                    "id": "#GATK-HaplotypeCaller.cwl/GVCFGQBands"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--activeProbabilityThreshold"
                    }, 
                    "doc": "Threshold for the probability of a profile state being active.", 
                    "id": "#GATK-HaplotypeCaller.cwl/activeProbabilityThreshold"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--activeRegionExtension"
                    }, 
                    "doc": "The active region extension; if not provided defaults to Walker annotated default", 
                    "id": "#GATK-HaplotypeCaller.cwl/activeRegionExtension"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--activeRegionMaxSize"
                    }, 
                    "doc": "The active region maximum size; if not provided defaults to Walker annotated default", 
                    "id": "#GATK-HaplotypeCaller.cwl/activeRegionMaxSize"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--activeRegionOut"
                    }, 
                    "doc": "Output the active region to this IGV formatted file", 
                    "id": "#GATK-HaplotypeCaller.cwl/activeRegionOut"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--activityProfileOut"
                    }, 
                    "doc": "Output the raw activity profile results in IGV format", 
                    "id": "#GATK-HaplotypeCaller.cwl/activityProfileOut"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--allSitePLs"
                    }, 
                    "doc": "Annotate all sites with PLs", 
                    "id": "#GATK-HaplotypeCaller.cwl/allSitePLs"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "string"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "The set of alleles at which to genotype when --genotyping_mode is GENOTYPE_GIVEN_ALLELES", 
                    "id": "#GATK-HaplotypeCaller.cwl/alleles"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--allowNonUniqueKmersInRef"
                    }, 
                    "doc": "Allow graphs that have non-unique kmers in the reference", 
                    "id": "#GATK-HaplotypeCaller.cwl/allowNonUniqueKmersInRef"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--annotateNDA"
                    }, 
                    "doc": "If provided, we will annotate records with the number of alternate alleles that were discovered (but not necessarily genotyped) at a given site", 
                    "id": "#GATK-HaplotypeCaller.cwl/annotateNDA"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "string"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "One or more specific annotations to apply to variant calls", 
                    "id": "#GATK-HaplotypeCaller.cwl/annotation"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--bamOutput"
                    }, 
                    "doc": "File to which assembled haplotypes should be written", 
                    "id": "#GATK-HaplotypeCaller.cwl/bamOutput"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--bamWriterType"
                    }, 
                    "doc": "Which haplotypes should be written to the BAM.", 
                    "id": "#GATK-HaplotypeCaller.cwl/bamWriterType"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--consensus"
                    }, 
                    "doc": "The sigma of the band pass filter Gaussian kernel; if not provided defaults to Walker annotated default", 
                    "id": "#GATK-HaplotypeCaller.cwl/bandPassSigma"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "string"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "comp binds reference ordered data. This argument supports ROD files of the following types BCF2, VCF, VCF3", 
                    "id": "#GATK-HaplotypeCaller.cwl/comp"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--consensus"
                    }, 
                    "doc": "Print out very verbose debug information about each triggering active region", 
                    "id": "#GATK-HaplotypeCaller.cwl/consensus"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--contamination_fraction_to_filter"
                    }, 
                    "doc": "Tab-separated File containing fraction of contamination in sequencing data (per sample) to aggressively remove. Format should be \"\" (Contamination is double) per line; No header.", 
                    "id": "#GATK-HaplotypeCaller.cwl/contamination"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "controls the number of CPU threads allocated to each data thread", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-nct"
                    }, 
                    "id": "#GATK-HaplotypeCaller.cwl/cpu_threads"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--dbsnp"
                    }, 
                    "doc": "latest_dbsnp.vcf set of known indels", 
                    "id": "#GATK-HaplotypeCaller.cwl/dbsnp"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--debug"
                    }, 
                    "doc": "Print out very verbose debug information about each triggering active region", 
                    "id": "#GATK-HaplotypeCaller.cwl/debug"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--disableOptimizations"
                    }, 
                    "doc": "Dont skip calculations in ActiveRegions with no variants", 
                    "id": "#GATK-HaplotypeCaller.cwl/disableOptimizations"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--doNotRunPhysicalPhasing"
                    }, 
                    "doc": "As of GATK 3.3, HaplotypeCaller outputs physical (read-based) information (see version 3.3 release notes and documentation for details). This argument disables that behavior.", 
                    "id": "#GATK-HaplotypeCaller.cwl/doNotRunPhysicalPhasing"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--dontIncreaseKmerSizesForCycles"
                    }, 
                    "doc": "Disable iterating over kmer sizes when graph cycles are detected", 
                    "id": "#GATK-HaplotypeCaller.cwl/dontIncreaseKmerSizesForCycles"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--dontTrimActiveRegions"
                    }, 
                    "doc": "If specified, we will not trim down the active region from the full region (active + extension) to just the active interval for genotyping", 
                    "id": "#GATK-HaplotypeCaller.cwl/dontTrimActiveRegions"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--emitRefConfidence"
                    }, 
                    "doc": "Mode for emitting reference confidence scores", 
                    "id": "#GATK-HaplotypeCaller.cwl/emitRefConfidence"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "string"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "One or more specific annotations to exclude", 
                    "id": "#GATK-HaplotypeCaller.cwl/excludeAnnotation"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--forceActive"
                    }, 
                    "doc": "If provided, all bases will be tagged as active", 
                    "id": "#GATK-HaplotypeCaller.cwl/forceActive"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--gcpHMM"
                    }, 
                    "doc": "Flat gap continuation penalty for use in the Pair HMM", 
                    "id": "#GATK-HaplotypeCaller.cwl/gcpHMM"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--genotyping_mode"
                    }, 
                    "doc": "The --genotyping_mode argument is an enumerated type (GenotypingOutputMode), which can have one of the following values", 
                    "id": "#GATK-HaplotypeCaller.cwl/genotyping_mode"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--phredScaledGlobalReadMismappingRate"
                    }, 
                    "doc": "The global assumed mismapping rate for reads", 
                    "id": "#GATK-HaplotypeCaller.cwl/globalMAPQ"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--graphOutput"
                    }, 
                    "doc": "Write debug assembly graph information to this file", 
                    "id": "#GATK-HaplotypeCaller.cwl/graphOutput"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "string", 
                        "inputBinding": {
                            "prefix": "--group"
                        }
                    }, 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "One or more classes/groups of annotations to apply to variant calls", 
                    "id": "#GATK-HaplotypeCaller.cwl/group"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--heterozygosity"
                    }, 
                    "doc": "Heterozygosity for indel calling", 
                    "id": "#GATK-HaplotypeCaller.cwl/heterozygosity"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--indel_heterozygosity"
                    }, 
                    "doc": "Heterozygosity for indel calling", 
                    "id": "#GATK-HaplotypeCaller.cwl/indel_heterozygosity"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-I"
                    }, 
                    "secondaryFiles": [
                        "^.bai"
                    ], 
                    "doc": "bam file produced after printReads", 
                    "id": "#GATK-HaplotypeCaller.cwl/inputBam_HaplotypeCaller"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "double"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "Input prior for calls", 
                    "id": "#GATK-HaplotypeCaller.cwl/input_prior"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--interval_padding"
                    }, 
                    "doc": "Amount of padding (in bp) to add to each interval", 
                    "id": "#GATK-HaplotypeCaller.cwl/interval_padding"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--intervals"
                    }, 
                    "doc": "One or more genomic intervals over which to operate", 
                    "id": "#GATK-HaplotypeCaller.cwl/intervals"
                }, 
                {
                    "type": "string", 
                    "default": "-Xmx4g", 
                    "inputBinding": {
                        "position": 0
                    }, 
                    "id": "#GATK-HaplotypeCaller.cwl/java_arg"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "int"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "Kmer size to use in the read threading assembler", 
                    "id": "#GATK-HaplotypeCaller.cwl/kmerSize"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--maxNumHaplotypesInPopulation"
                    }, 
                    "doc": "Maximum number of haplotypes to consider for your population", 
                    "id": "#GATK-HaplotypeCaller.cwl/maxNumHaplotypesInPopulation"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--maxReadsInRegionPerSample"
                    }, 
                    "doc": "Maximum reads in an active region", 
                    "id": "#GATK-HaplotypeCaller.cwl/maxReadsInRegionPerSample"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--max_alternate_alleles"
                    }, 
                    "doc": "Maximum number of alternate alleles to genotype", 
                    "id": "#GATK-HaplotypeCaller.cwl/max_alternate_alleles"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--minDanglingBranchLength"
                    }, 
                    "doc": "Minimum length of a dangling branch to attempt recovery", 
                    "id": "#GATK-HaplotypeCaller.cwl/minDanglingBranchLength"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--minPruning"
                    }, 
                    "doc": "Minimum support to not prune paths in the graph", 
                    "id": "#GATK-HaplotypeCaller.cwl/minPruning"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--minReadsPerAlignmentStart"
                    }, 
                    "doc": "Minimum number of reads sharing the same alignment start for each genomic location in an active region", 
                    "id": "#GATK-HaplotypeCaller.cwl/minReadsPerAlignmentStart"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--min_base_quality_score"
                    }, 
                    "doc": "Minimum base quality required to consider a base for calling", 
                    "id": "#GATK-HaplotypeCaller.cwl/min_base_quality_score"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--numPruningSamples"
                    }, 
                    "doc": "Number of samples that must pass the minPruning threshold", 
                    "id": "#GATK-HaplotypeCaller.cwl/numPruningSamples"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--output_mode"
                    }, 
                    "doc": "The PCR indel model to use", 
                    "id": "#GATK-HaplotypeCaller.cwl/output_mode"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-o"
                    }, 
                    "doc": "name of the output file from HaplotypeCaller", 
                    "id": "#GATK-HaplotypeCaller.cwl/outputfile_HaplotypeCaller"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--pcr_indel_model"
                    }, 
                    "doc": "The PCR indel model to use", 
                    "id": "#GATK-HaplotypeCaller.cwl/pcr_indel_model"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-R"
                    }, 
                    "secondaryFiles": [
                        ".amb", 
                        ".ann", 
                        ".bwt", 
                        ".pac", 
                        ".sa", 
                        ".fai", 
                        "^.dict"
                    ], 
                    "id": "#GATK-HaplotypeCaller.cwl/reference"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--sample_name"
                    }, 
                    "doc": "Use additional trigger on variants found in an external alleles file", 
                    "id": "#GATK-HaplotypeCaller.cwl/sample_name"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--sample_ploidy"
                    }, 
                    "doc": "Use additional trigger on variants found in an external alleles file", 
                    "id": "#GATK-HaplotypeCaller.cwl/sample_ploidy"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--standard_min_confidence_threshold_for_calling"
                    }, 
                    "doc": "The minimum phred-scaled confidence threshold at which variants should be called", 
                    "id": "#GATK-HaplotypeCaller.cwl/stand_call_conf"
                }, 
                {
                    "type": [
                        "null", 
                        "double"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--standard_min_confidence_threshold_for_emitting"
                    }, 
                    "doc": "The minimum phred-scaled confidence threshold at which variants should be emitted (and filtered with LowQual if less than the calling threshold)", 
                    "id": "#GATK-HaplotypeCaller.cwl/stand_emit_conf"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--useAllelesTrigger"
                    }, 
                    "doc": "Use additional trigger on variants found in an external alleles file", 
                    "id": "#GATK-HaplotypeCaller.cwl/useAllelesTrigger"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--useFilteredReadsForAnnotations"
                    }, 
                    "doc": "Use the contamination-filtered read maps for the purposes of annotating variants", 
                    "id": "#GATK-HaplotypeCaller.cwl/useFilteredReadsForAnnotations"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--variant_index_parameter"
                    }, 
                    "doc": "Index parameter, needed by emitRefConfidence GVCF if output extension not .g.vcf", 
                    "id": "#GATK-HaplotypeCaller.cwl/variant_index_parameter"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--variant_index_type"
                    }, 
                    "doc": "Index type, needed by emitRefConfidence GVCF if output extension not .g.vcf", 
                    "id": "#GATK-HaplotypeCaller.cwl/variant_index_type"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_HaplotypeCaller)"
                    }, 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "id": "#GATK-HaplotypeCaller.cwl/output_HaplotypeCaller"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "outputBinding": {
                        "glob": "$(inputs.bamOutput)"
                    }, 
                    "id": "#GATK-HaplotypeCaller.cwl/output_HaplotypesBam"
                }
            ], 
            "arguments": [
                {
                    "valueFrom": "$(runtime.tmpdir)", 
                    "position": 0, 
                    "separate": false, 
                    "prefix": "-Djava.io.tmpdir="
                }, 
                {
                    "valueFrom": "HaplotypeCaller", 
                    "position": 2, 
                    "prefix": "-T"
                }
            ], 
            "baseCommand": [
                "java"
            ], 
            "doc": "GATK-RealignTargetCreator.cwl is developed for CWL consortium\nCall germline SNPs and indels via local re-assembly of haplotypes\n", 
            "id": "#GATK-HaplotypeCaller.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "$import": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/gatk-base:3"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "3.8"
                            ], 
                            "package": "gatk", 
                            "https://schema.org/citation": "https://dx.doi.org/10.1038/ng.806"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-jar"
                    }, 
                    "id": "#GATK-PrintReads.cwl/GATKJar"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "controls the number of CPU threads allocated to each data thread", 
                    "default": 8, 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-nct"
                    }, 
                    "id": "#GATK-PrintReads.cwl/cpu_threads"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-I"
                    }, 
                    "secondaryFiles": [
                        "^.bai"
                    ], 
                    "doc": "bam file produced after indelRealigner", 
                    "id": "#GATK-PrintReads.cwl/inputBam_printReads"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-BQSR"
                    }, 
                    "doc": "the recalibration table produced by BaseRecalibration", 
                    "id": "#GATK-PrintReads.cwl/input_baseRecalibrator"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--interval_padding"
                    }, 
                    "doc": "Amount of padding (in bp) to add to each interval", 
                    "id": "#GATK-PrintReads.cwl/interval_padding"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File", 
                            "inputBinding": {
                                "prefix": "--intervals"
                            }
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "One or more genomic intervals over which to operate", 
                    "id": "#GATK-PrintReads.cwl/intervals"
                }, 
                {
                    "type": "string", 
                    "default": "-Xmx4g", 
                    "inputBinding": {
                        "position": 0
                    }, 
                    "id": "#GATK-PrintReads.cwl/java_arg"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--number"
                    }, 
                    "doc": "Exclude all reads with this platform from the output", 
                    "id": "#GATK-PrintReads.cwl/number"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-o"
                    }, 
                    "doc": "name of the output file from indelRealigner", 
                    "id": "#GATK-PrintReads.cwl/outputfile_printReads"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--platform"
                    }, 
                    "doc": "Exclude all reads with this platform from the output", 
                    "id": "#GATK-PrintReads.cwl/platform"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--readGroup"
                    }, 
                    "doc": "Exclude all reads with this read group from the output", 
                    "id": "#GATK-PrintReads.cwl/readGroup"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-R"
                    }, 
                    "secondaryFiles": [
                        ".amb", 
                        ".ann", 
                        ".bwt", 
                        ".pac", 
                        ".sa", 
                        ".fai", 
                        "^.dict"
                    ], 
                    "id": "#GATK-PrintReads.cwl/reference"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "id": "#GATK-PrintReads.cwl/sample_file"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "string"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "Sample name to be included in the analysis. Can be specified multiple times.", 
                    "id": "#GATK-PrintReads.cwl/sample_name"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--simplify"
                    }, 
                    "doc": "Erase all extra attributes in the read but keep the read group information", 
                    "id": "#GATK-PrintReads.cwl/simplify"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_printReads)"
                    }, 
                    "secondaryFiles": [
                        "^.bai"
                    ], 
                    "id": "#GATK-PrintReads.cwl/output_printReads"
                }
            ], 
            "arguments": [
                {
                    "valueFrom": "$(runtime.tmpdir)", 
                    "position": 0, 
                    "separate": false, 
                    "prefix": "-Djava.io.tmpdir="
                }, 
                {
                    "valueFrom": "PrintReads", 
                    "position": 2, 
                    "prefix": "-T"
                }
            ], 
            "baseCommand": [
                "java"
            ], 
            "doc": "GATK-RealignTargetCreator.cwl is developed for CWL consortium\nPrints all reads that have a mapping quality above zero\n  Usage: java -Xmx4g -jar GenomeAnalysisTK.jar -T PrintReads -R reference.fasta -I input1.bam -I input2.bam -o output.bam --read_filter MappingQualityZero\n", 
            "id": "#GATK-PrintReads.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "doc": "GATK-VariantsRecalibrator.cwl is developed for CWL consortium\n\nUsage:\n```\njava -Xmx8G \\\n      -jar gatk.jar\n      -T VariantRecalibrator \\\n      -R [reference_fasta] \\\n      -recalFile    $tmpDir/out.recal \\\n      -tranchesFile $tmpDir/out.tranches \\\n      -rscriptFile  $tmpDir/out.R \\\n      -nt 4 \\\n      -an MQRankSum -an ReadPosRankSum -an DP -an FS -an QD \\\n      -mode SNP \\\n      -resource:hapmap,known=false,training=true,truth=true,prior=15.0 [hapmap_vcf] \\\n      -resource:dbsnp,known=true,training=false,truth=false,prior=2.0  [dbsnp_vcf] \\\n      -resource:omni,known=false,training=true,truth=true,prior=12.0   [1komni_vcf] \\\n      -resource:1000G,known=false,training=true,truth=false,prior=10.0 [1ksnp_vcf]\n```\n", 
            "requirements": [
                {
                    "$import": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/gatk-base:3"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "3.8"
                            ], 
                            "package": "gatk", 
                            "https://schema.org/citation": "https://dx.doi.org/10.1038/ng.806"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-jar"
                    }, 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/GATKJar"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "string", 
                        "inputBinding": {
                            "prefix": "-an"
                        }
                    }, 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "The names of the annotations which should used for calculations", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/annotations"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--intervals"
                    }, 
                    "doc": "One or more genomic intervals over which to operate", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/intervals"
                }, 
                {
                    "type": "string", 
                    "default": "-Xmx8g", 
                    "inputBinding": {
                        "position": 0
                    }, 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/java_arg"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--maxGaussians"
                    }, 
                    "doc": "Maximum number of different clusters (gaussians) of variants the program is allowed to try to identify.", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/max_gaussians"
                }, 
                {
                    "type": "string", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-recalFile"
                    }, 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/outputfile_recal"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-rscriptFile"
                    }, 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/outputfile_rscript"
                }, 
                {
                    "type": "string", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-tranchesFile"
                    }, 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/outputfile_tranches"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".fai", 
                        "^.dict"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-R"
                    }, 
                    "doc": "reference genome", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/reference"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-resource:dbsnp,known=true,training=false,truth=false,prior=2.0"
                    }, 
                    "doc": "dbSNP reference data", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/resource_dbsnp"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-resource:mills,known=false,training=true,truth=true,prior=12.0"
                    }, 
                    "doc": "hapmap reference data", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/resource_mills"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-nt"
                    }, 
                    "doc": "Number of data threads to allocate to this analysis", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/threads"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-input"
                    }, 
                    "doc": "input vcf File raw variant calls from haplotype caller", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/variants"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_recal)"
                    }, 
                    "secondaryFiles": [
                        ".pdf"
                    ], 
                    "doc": "the recal File", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/recal_File"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_tranches)"
                    }, 
                    "secondaryFiles": [
                        ".pdf"
                    ], 
                    "doc": "the tranches File", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/tranches_File"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_rscript)"
                    }, 
                    "secondaryFiles": [
                        ".pdf"
                    ], 
                    "doc": "The output recalibration R script for the plots", 
                    "id": "#GATK-VariantRecalibrator-Indels.cwl/vqsr_rscript"
                }
            ], 
            "arguments": [
                {
                    "valueFrom": "$(runtime.tmpdir)", 
                    "position": 0, 
                    "separate": false, 
                    "prefix": "-Djava.io.tmpdir="
                }, 
                {
                    "valueFrom": "VariantRecalibrator", 
                    "position": 2, 
                    "prefix": "-T"
                }, 
                {
                    "valueFrom": "INDEL", 
                    "position": 2, 
                    "prefix": "-mode"
                }
            ], 
            "baseCommand": [
                "java"
            ], 
            "id": "#GATK-VariantRecalibrator-Indels.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "doc": "GATK-VariantsRecalibrator.cwl is developed for CWL consortium\n\nUsage:\n```\njava -Xmx8G \\\n      -jar gatk.jar\n      -T VariantRecalibrator \\\n      -R [reference_fasta] \\\n      -recalFile    $tmpDir/out.recal \\\n      -tranchesFile $tmpDir/out.tranches \\\n      -rscriptFile  $tmpDir/out.R \\\n      -nt 4 \\\n      -an MQRankSum -an ReadPosRankSum -an DP -an FS -an QD \\\n      -mode SNP \\\n      -resource:hapmap,known=false,training=true,truth=true,prior=15.0 [hapmap_vcf] \\\n      -resource:dbsnp,known=true,training=false,truth=false,prior=2.0  [dbsnp_vcf] \\\n      -resource:omni,known=false,training=true,truth=true,prior=12.0   [1komni_vcf] \\\n      -resource:1000G,known=false,training=true,truth=false,prior=10.0 [1ksnp_vcf]\n```\n", 
            "requirements": [
                {
                    "$import": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/gatk-base:3"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "3.8"
                            ], 
                            "package": "gatk", 
                            "https://schema.org/citation": "https://dx.doi.org/10.1038/ng.806"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-jar"
                    }, 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/GATKJar"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "string", 
                        "inputBinding": {
                            "prefix": "-an"
                        }
                    }, 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "The names of the annotations which should used for calculations", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/annotations"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--intervals"
                    }, 
                    "doc": "One or more genomic intervals over which to operate", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/intervals"
                }, 
                {
                    "type": "string", 
                    "default": "-Xmx8g", 
                    "inputBinding": {
                        "position": 0
                    }, 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/java_arg"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--maxGaussians"
                    }, 
                    "doc": "Maximum number of different clusters (gaussians) of variants the program is allowed to try to identify.", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/max_gaussians"
                }, 
                {
                    "type": "string", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-recalFile"
                    }, 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/outputfile_recal"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-rscriptFile"
                    }, 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/outputfile_rscript"
                }, 
                {
                    "type": "string", 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-tranchesFile"
                    }, 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/outputfile_tranches"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".fai", 
                        "^.dict"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-R"
                    }, 
                    "doc": "reference genome", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/reference"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-resource:1000G,known=false,training=true,truth=false,prior=10.0"
                    }, 
                    "doc": "1000 genome reference data", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/resource_1kg"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-resource:dbsnp,known=true,training=false,truth=false,prior=2.0"
                    }, 
                    "doc": "dbSNP reference data", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/resource_dbsnp"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-resource:hapmap,known=false,training=true,truth=true,prior=15.0"
                    }, 
                    "doc": "hapmap reference data", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/resource_hapmap"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-resource:omni,known=false,training=true,truth=false,prior=12.0"
                    }, 
                    "doc": "omni reference data", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/resource_omni"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-nt"
                    }, 
                    "doc": "Number of data threads to allocate to this analysis", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/threads"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "-input"
                    }, 
                    "doc": "input vcf File raw variant calls from haplotype caller", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/variants"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_recal)"
                    }, 
                    "secondaryFiles": [
                        ".pdf"
                    ], 
                    "doc": "the recal File", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/recal_File"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_tranches)"
                    }, 
                    "secondaryFiles": [
                        ".pdf"
                    ], 
                    "doc": "the tranches File", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/tranches_File"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "outputBinding": {
                        "glob": "$(inputs.outputfile_rscript)"
                    }, 
                    "secondaryFiles": [
                        ".pdf"
                    ], 
                    "doc": "The output recalibration R script for the plots", 
                    "id": "#GATK-VariantRecalibrator-SNPs.cwl/vqsr_rscript"
                }
            ], 
            "arguments": [
                {
                    "valueFrom": "$(runtime.tmpdir)", 
                    "position": 0, 
                    "separate": false, 
                    "prefix": "-Djava.io.tmpdir="
                }, 
                {
                    "valueFrom": "VariantRecalibrator", 
                    "position": 2, 
                    "prefix": "-T"
                }, 
                {
                    "valueFrom": "SNP", 
                    "position": 2, 
                    "prefix": "-mode"
                }
            ], 
            "baseCommand": [
                "java"
            ], 
            "id": "#GATK-VariantRecalibrator-SNPs.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "$import": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/bwa-samtools:0.7.12_1.2.1-254-6462e34"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "0.7.12"
                            ], 
                            "package": "bwa", 
                            "https://schema.org/citation": "https://dx.doi.org/10.1093/bioinformatics/btp324"
                        }, 
                        {
                            "version": [
                                "1.2-242-g4d56437"
                            ], 
                            "package": "samtools", 
                            "https://schema.org/citation": "https://doi.org/10.1093/bioinformatics/btp352"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "int"
                        }
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-I", 
                        "itemSeparator": ","
                    }, 
                    "id": "#bwa-mem-samtools.cwl/min_std_max_min"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-k"
                    }, 
                    "doc": "-k INT        minimum seed length [19]", 
                    "id": "#bwa-mem-samtools.cwl/minimum_seed_length"
                }, 
                {
                    "type": "string", 
                    "id": "#bwa-mem-samtools.cwl/output_filename"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-R"
                    }, 
                    "doc": "-R STR        read group header line such as '@RG\\tID:foo\\tSM:bar' [null]", 
                    "id": "#bwa-mem-samtools.cwl/read_group_header"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "inputBinding": {
                        "position": 3
                    }, 
                    "id": "#bwa-mem-samtools.cwl/reads"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "secondaryFiles": [
                        ".amb", 
                        ".ann", 
                        ".bwt", 
                        ".pac", 
                        ".sa"
                    ], 
                    "id": "#bwa-mem-samtools.cwl/reference"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-t"
                    }, 
                    "doc": "-t INT        number of threads [1]", 
                    "id": "#bwa-mem-samtools.cwl/threads"
                }
            ], 
            "stdout": "$(inputs.output_filename)", 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_filename)"
                    }, 
                    "id": "#bwa-mem-samtools.cwl/output"
                }
            ], 
            "baseCommand": [
                "bwamem-to-samtools.sh"
            ], 
            "doc": "Usage: bwa mem [options] <idxbase> <in1.fq> [in2.fq]\n\nAlgorithm options:\n       -w INT        band width for banded alignment [100]\n       -d INT        off-diagonal X-dropoff [100]\n       -r FLOAT      look for internal seeds inside a seed longer than {-k} * FLOAT [1.5]\n       -y INT        seed occurrence for the 3rd round seeding [20]\n       -c INT        skip seeds with more than INT occurrences [500]\n       -D FLOAT      drop chains shorter than FLOAT fraction of the longest overlapping chain [0.50]\n       -W INT        discard a chain if seeded bases shorter than INT [0]\n       -m INT        perform at most INT rounds of mate rescues for each read [50]\n       -S            skip mate rescue\n       -P            skip pairing; mate rescue performed unless -S also in use\n       -e            discard full-length exact matches\n\nScoring options:\n\n       -A INT        score for a sequence match, which scales options -TdBOELU unless overridden [1]\n       -B INT        penalty for a mismatch [4]\n       -O INT[,INT]  gap open penalties for deletions and insertions [6,6]\n       -E INT[,INT]  gap extension penalty; a gap of size k cost '{-O} + {-E}*k' [1,1]\n       -L INT[,INT]  penalty for 5'- and 3'-end clipping [5,5]\n       -U INT        penalty for an unpaired read pair [17]\n\n       -x STR        read type. Setting -x changes multiple parameters unless overriden [null]\n                     pacbio: -k17 -W40 -r10 -A1 -B1 -O1 -E1 -L0  (PacBio reads to ref)\n                     ont2d: -k14 -W20 -r10 -A1 -B1 -O1 -E1 -L0  (Oxford Nanopore 2D-reads to ref)\n                     intractg: -B9 -O16 -L5  (intra-species contigs to ref)\n\nInput/output options:\n\n       -p            smart pairing (ignoring in2.fq)\n       -R STR        read group header line such as '@RG\\tID:foo\\tSM:bar' [null]\n       -H STR/FILE   insert STR to header if it starts with @; or insert lines in FILE [null]\n       -j            treat ALT contigs as part of the primary assembly (i.e. ignore <idxbase>.alt file)\n\n       -v INT        verbose level: 1=error, 2=warning, 3=message, 4+=debugging [3]\n       -T INT        minimum score to output [30]\n       -h INT[,INT]  if there are <INT hits with score >80% of the max score, output all in XA [5,200]\n       -a            output all alignments for SE or unpaired PE\n       -C            append FASTA/FASTQ comment to SAM output\n       -V            output the reference FASTA header in the XR tag\n       -Y            use soft clipping for supplementary alignments\n       -M            mark shorter split hits as secondary\n\n       -I FLOAT[,FLOAT[,INT[,INT]]]\n                     specify the mean, standard deviation (10% of the mean if absent), max\n                     (4 sigma from the mean if absent) and min of the insert size distribution.\n                     FR orientation only. [inferred]\n\nNote: Please read the man page for detailed description of the command line and options.\n", 
            "id": "#bwa-mem-samtools.cwl"
        }, 
        {
            "class": "ExpressionTool", 
            "label": "Given a NamedFASTQFilePairType returns an array of the files contained within", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "$import": "#bespin-types.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "id": "#extract-named-file-pair-details.cwl/library"
                }, 
                {
                    "type": "string", 
                    "id": "#extract-named-file-pair-details.cwl/platform"
                }, 
                {
                    "type": "#bespin-types.yml/NamedFASTQFilePairType", 
                    "id": "#extract-named-file-pair-details.cwl/read_pair"
                }
            ], 
            "outputs": [
                {
                    "type": "string", 
                    "id": "#extract-named-file-pair-details.cwl/read_group_header"
                }, 
                {
                    "type": "string", 
                    "id": "#extract-named-file-pair-details.cwl/read_pair_name"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#extract-named-file-pair-details.cwl/reads"
                }
            ], 
            "expression": "${\n  var readPairName = inputs.read_pair.name;\n  var readGroupHeader = \"@RG\" +\n    \"\\\\tID:\" + readPairName +\n    \"\\\\tLB:\" + inputs.library +\n    \"\\\\tPL:\" + inputs.platform +\n    \"\\\\tPU:\" + readPairName +\n    \"\\\\tSM:\" + readPairName;\n  return {\n    reads: [\n      inputs.read_pair.file1,\n      inputs.read_pair.file2,\n    ],\n    read_pair_name: readPairName,\n    read_group_header: readGroupHeader\n  };\n\n}\n", 
            "id": "#extract-named-file-pair-details.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/fastqc:0.11.4"
                }, 
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "0.11.4"
                            ], 
                            "package": "fastqc", 
                            "https://schema.org/citation": "https://www.bioinformatics.babraham.ac.uk/projects/fastqc/"
                        }
                    ]
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "default": "fastq", 
                    "inputBinding": {
                        "position": 3, 
                        "prefix": "--format"
                    }, 
                    "id": "#fastqc.cwl/format"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 4
                    }, 
                    "id": "#fastqc.cwl/input_fastq_file"
                }, 
                {
                    "type": "boolean", 
                    "default": true, 
                    "inputBinding": {
                        "prefix": "--noextract", 
                        "position": 2
                    }, 
                    "id": "#fastqc.cwl/noextract"
                }, 
                {
                    "type": "int", 
                    "default": 1, 
                    "inputBinding": {
                        "position": 5, 
                        "prefix": "--threads"
                    }, 
                    "id": "#fastqc.cwl/threads"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "*_fastqc.zip"
                    }, 
                    "id": "#fastqc.cwl/output_qc_report"
                }
            ], 
            "baseCommand": "fastqc", 
            "arguments": [
                {
                    "valueFrom": "$('/tmp')", 
                    "prefix": "--dir", 
                    "position": 5
                }, 
                {
                    "valueFrom": "$(runtime.outdir)", 
                    "prefix": "-o", 
                    "position": 5
                }
            ], 
            "id": "#fastqc.cwl"
        }, 
        {
            "class": "ExpressionTool", 
            "label": "Moves an array of File pairs into a named directory", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": {
                            "type": "array", 
                            "items": "File"
                        }
                    }, 
                    "id": "#file-pairs-to-directory.cwl/file_pairs"
                }, 
                {
                    "type": "string", 
                    "id": "#file-pairs-to-directory.cwl/name"
                }
            ], 
            "outputs": [
                {
                    "type": "Directory", 
                    "id": "#file-pairs-to-directory.cwl/outdir"
                }
            ], 
            "expression": "${\n  var files = inputs.file_pairs.reduce(function(a,b) {\n      return a.concat(b);\n  }, []);\n\n  var result = {\n    outdir: {\n      class: 'Directory',\n      basename: inputs.name,\n      listing: files\n    }\n  };\n\n  return result;\n}\n", 
            "id": "#file-pairs-to-directory.cwl"
        }, 
        {
            "class": "ExpressionTool", 
            "label": "Moves an array of Files into a named directory", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#files-to-directory.cwl/files"
                }, 
                {
                    "type": "string", 
                    "id": "#files-to-directory.cwl/name"
                }
            ], 
            "outputs": [
                {
                    "type": "Directory", 
                    "id": "#files-to-directory.cwl/outdir"
                }
            ], 
            "expression": "${\n  var result = {\n    outdir: {\n      class: 'Directory',\n      basename: inputs.name,\n      listing: inputs.files\n    }\n  };\n\n  return result;\n}\n", 
            "id": "#files-to-directory.cwl"
        }, 
        {
            "class": "ExpressionTool", 
            "label": "Generates a set of file names for joint steps based on an input name", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/name"
                }
            ], 
            "outputs": [
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/joint_genotype_raw_variants_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/snps_indels_recalibrated_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/snps_indels_vqsr_recal_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/snps_indels_vqsr_rscript_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/snps_indels_vqsr_tranches_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/snps_recalibrated_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/snps_vqsr_recal_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/snps_vqsr_rscript_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-joint-filenames.cwl/snps_vqsr_tranches_output_filename"
                }
            ], 
            "expression": "${\n  function makeFilename(base, suffix, extension) {\n    return base + '-' + suffix + '.' + extension;\n  }\n  var base = inputs.name\n\n  return {\n    joint_genotype_raw_variants_output_filename: makeFilename(base, 'raw_variants', 'g.vcf'),\n    snps_vqsr_recal_output_filename: makeFilename(base, 'snps_vqsr_recal', 'out'),\n    snps_vqsr_tranches_output_filename: makeFilename(base, 'snps_vqsr_tranches', 'out'),\n    snps_vqsr_rscript_output_filename: makeFilename(base, 'snps_vqsr', 'R'),\n    snps_recalibrated_output_filename: makeFilename(base, 'snps_recalibrated', 'vcf'),\n    snps_indels_vqsr_recal_output_filename: makeFilename(base, 'snps_indels_vqsr_recal', 'out'),\n    snps_indels_vqsr_tranches_output_filename: makeFilename(base, 'snps_indels_vqsr_tranches', 'out'),\n    snps_indels_vqsr_rscript_output_filename: makeFilename(base, 'snps_indels_vqsr', 'R'),\n    snps_indels_recalibrated_output_filename: makeFilename(base, 'snps_indels_recalibrated', 'vcf')\n  };\n}\n", 
            "id": "#generate-joint-filenames.cwl"
        }, 
        {
            "class": "ExpressionTool", 
            "label": "Generates a set of file names for preprocessing steps based on an input sample name", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/sample_name"
                }
            ], 
            "outputs": [
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/dedup_metrics_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/dedup_reads_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/haplotypes_bam_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/hs_metrics_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/mapped_reads_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/raw_variants_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/recal_reads_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/recal_table_output_filename"
                }, 
                {
                    "type": "string", 
                    "id": "#generate-sample-filenames.cwl/sorted_reads_output_filename"
                }
            ], 
            "expression": "${\n  function makeFilename(base, suffix, extension) {\n    return base + '-' + suffix + '.' + extension;\n  }\n  var base = inputs.sample_name\n\n  return {\n    mapped_reads_output_filename: makeFilename(base, 'mapped', 'bam'),\n    sorted_reads_output_filename: makeFilename(base, 'sorted', 'bam'),\n    dedup_reads_output_filename: makeFilename(base, 'dedup', 'bam'),\n    dedup_metrics_output_filename: makeFilename(base, 'dedup-metrics', 'out'),\n    recal_reads_output_filename: makeFilename(base, 'recal', 'bam'),\n    recal_table_output_filename: makeFilename(base, 'recal', 'table'),\n    raw_variants_output_filename: makeFilename(base, 'raw_variants', 'g.vcf'),\n    haplotypes_bam_output_filename:  makeFilename(base, 'haplotypes', 'bam'),\n    hs_metrics_output_filename: makeFilename(base, 'hs', 'txt')\n  };\n}\n", 
            "id": "#generate-sample-filenames.cwl"
        }, 
        {
            "class": "ExpressionTool", 
            "label": "Given an ExomeseqStudyType returns an array of the annotations to use.", 
            "doc": "The InbreedingCoeff is a population level statistic that requires at least 10 samples in order to be computed. For projects with fewer samples, or that includes many closely related samples (such as a family) please omit this annotation from the command line. From https://software.broadinstitute.org/gatk/documentation/article?id=1259\n", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "$import": "#bespin-types.yml"
                }
            ], 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "string"
                    }, 
                    "id": "#generate-variant-recalibration-annotation-set.cwl/base_annotations"
                }, 
                {
                    "type": "#bespin-types.yml/ExomeseqStudyType", 
                    "id": "#generate-variant-recalibration-annotation-set.cwl/study_type"
                }
            ], 
            "outputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "string"
                    }, 
                    "id": "#generate-variant-recalibration-annotation-set.cwl/annotations"
                }
            ], 
            "expression": "${\n  var annotations = inputs.base_annotations;\n  var inputStudyType = inputs.study_type;\n  if(inputStudyType === \"Large Population\") {\n    annotations.push(\"InbreedingCoeff\");\n  }\n  return {\"annotations\": annotations };\n}\n", 
            "id": "#generate-variant-recalibration-annotation-set.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/picard:2.10.7"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "2.10.7"
                            ], 
                            "package": "picard", 
                            "https://schema.org/citation": "http://broadinstitute.github.io/picard"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "doc": "The bed file to be converted to interval_list format.  Required.", 
                    "inputBinding": {
                        "prefix": "I=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-BedToIntervalList.cwl/input_file"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Interval list output filename.", 
                    "default": "list.interval_list", 
                    "inputBinding": {
                        "prefix": "O=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-BedToIntervalList.cwl/output_filename"
                }, 
                {
                    "type": "File", 
                    "doc": "The reference sequences in fasta format.", 
                    "inputBinding": {
                        "prefix": "SD=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-BedToIntervalList.cwl/reference_sequence"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_filename)"
                    }, 
                    "id": "#picard-BedToIntervalList.cwl/output_interval_list_file"
                }
            ], 
            "baseCommand": [
                "java", 
                "-Xmx4g"
            ], 
            "arguments": [
                {
                    "valueFrom": "/opt/picard/picard.jar", 
                    "position": -1, 
                    "prefix": "-jar"
                }, 
                {
                    "valueFrom": "BedToIntervalList", 
                    "position": 0
                }
            ], 
            "id": "#picard-BedToIntervalList.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/picard:2.10.7"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "2.10.7"
                            ], 
                            "package": "picard", 
                            "https://schema.org/citation": "http://broadinstitute.github.io/picard"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "The bait interval file in picard interval_list format (from capture kit).", 
                    "inputBinding": {
                        "prefix": "BAIT_INTERVALS=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-CollectHsMetrics.cwl/bait_intervals"
                }, 
                {
                    "type": "File", 
                    "doc": "The BAM or SAM file to collect metrics from.  Required.", 
                    "inputBinding": {
                        "prefix": "I=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-CollectHsMetrics.cwl/input_file"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "The metrics output filename.", 
                    "default": "hs_metrics.txt", 
                    "inputBinding": {
                        "prefix": "O=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-CollectHsMetrics.cwl/output_filename"
                }, 
                {
                    "type": "File", 
                    "doc": "The reference sequences in fasta format.", 
                    "inputBinding": {
                        "prefix": "R=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-CollectHsMetrics.cwl/reference_sequence"
                }, 
                {
                    "type": "File", 
                    "doc": "The target interval file in picard interval_list format (from capture kit).", 
                    "inputBinding": {
                        "prefix": "TARGET_INTERVALS=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-CollectHsMetrics.cwl/target_intervals"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_filename)"
                    }, 
                    "id": "#picard-CollectHsMetrics.cwl/output_hs_metrics_file"
                }
            ], 
            "baseCommand": [
                "java", 
                "-Xmx4g"
            ], 
            "arguments": [
                {
                    "valueFrom": "/opt/picard/picard.jar", 
                    "position": -1, 
                    "prefix": "-jar"
                }, 
                {
                    "valueFrom": "CollectHsMetrics", 
                    "position": 0
                }
            ], 
            "id": "#picard-CollectHsMetrics.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/picard:2.10.7"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "2.10.7"
                            ], 
                            "package": "picard", 
                            "https://schema.org/citation": "http://broadinstitute.github.io/picard"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "One or more input SAM or BAM files to analyze. Must be coordinate sorted.", 
                    "inputBinding": {
                        "prefix": "INPUT=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-MarkDuplicates.cwl/input_file"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Output metrics filename", 
                    "default": "marked_dup_metrics.txt", 
                    "inputBinding": {
                        "prefix": "METRICS_FILE=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-MarkDuplicates.cwl/metrics_filename"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Output filename", 
                    "default": "marked_duplicates.bam", 
                    "inputBinding": {
                        "prefix": "OUTPUT=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-MarkDuplicates.cwl/output_filename"
                }, 
                {
                    "type": "boolean", 
                    "doc": "If true do not write duplicates to the output file instead of writing them with appropriate flags set.  (Default true).", 
                    "default": true, 
                    "inputBinding": {
                        "prefix": "REMOVE_DUPLICATES=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-MarkDuplicates.cwl/remove_duplicates"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_filename)"
                    }, 
                    "secondaryFiles": [
                        "^.bai"
                    ], 
                    "id": "#picard-MarkDuplicates.cwl/output_dedup_bam_file"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.metrics_filename)"
                    }, 
                    "id": "#picard-MarkDuplicates.cwl/output_metrics_file"
                }
            ], 
            "baseCommand": [
                "java"
            ], 
            "arguments": [
                {
                    "valueFrom": "-Xmx4g", 
                    "position": -2
                }, 
                {
                    "valueFrom": "/opt/picard/picard.jar", 
                    "position": -1, 
                    "prefix": "-jar"
                }, 
                {
                    "valueFrom": "MarkDuplicates", 
                    "position": 0
                }, 
                {
                    "valueFrom": "CREATE_INDEX=True", 
                    "position": 0
                }
            ], 
            "id": "#picard-MarkDuplicates.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/picard:2.10.7"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "hints": [
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "2.10.7"
                            ], 
                            "package": "picard", 
                            "https://schema.org/citation": "http://broadinstitute.github.io/picard"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "The BAM or SAM file to sort.  Required.", 
                    "inputBinding": {
                        "prefix": "INPUT=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-SortSam.cwl/input_file"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "The sorted BAM or SAM output file.", 
                    "default": "sorted.bam", 
                    "inputBinding": {
                        "prefix": "OUTPUT=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-SortSam.cwl/output_filename"
                }, 
                {
                    "type": "string", 
                    "doc": "Sort order of output file  Required. Possible values: {unsorted, queryname, coordinate, duplicate}", 
                    "default": "coordinate", 
                    "inputBinding": {
                        "prefix": "SORT_ORDER=", 
                        "shellQuote": false
                    }, 
                    "id": "#picard-SortSam.cwl/sort_order"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_filename)"
                    }, 
                    "secondaryFiles": [
                        "^.bai"
                    ], 
                    "id": "#picard-SortSam.cwl/sorted"
                }
            ], 
            "baseCommand": [
                "java", 
                "-Xmx4g"
            ], 
            "arguments": [
                {
                    "valueFrom": "/opt/picard/picard.jar", 
                    "position": -1, 
                    "prefix": "-jar"
                }, 
                {
                    "valueFrom": "SortSam", 
                    "position": 0
                }
            ], 
            "id": "#picard-SortSam.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/trim-galore:0.4.4"
                }, 
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "1.14"
                            ], 
                            "package": "cutadapt", 
                            "https://schema.org/citation": "https://dx.doi.org/10.14806/ej.17.1.200"
                        }, 
                        {
                            "version": [
                                "0.4.4"
                            ], 
                            "package": "trimgalore", 
                            "https://schema.org/citation": "https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "boolean", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--paired"
                    }, 
                    "id": "#trim_galore.cwl/paired"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "inputBinding": {
                        "position": 3
                    }, 
                    "id": "#trim_galore.cwl/reads"
                }
            ], 
            "outputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputBinding": {
                        "glob": "*_trimming_report.txt"
                    }, 
                    "id": "#trim_galore.cwl/trim_reports"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputBinding": {
                        "glob": "*_val_*.fq*"
                    }, 
                    "id": "#trim_galore.cwl/trimmed_reads"
                }
            ], 
            "baseCommand": "trim_galore", 
            "arguments": [
                {
                    "valueFrom": "$(runtime.outdir)", 
                    "prefix": "-o", 
                    "position": 2
                }
            ], 
            "id": "#trim_galore.cwl"
        }, 
        {
            "class": "Workflow", 
            "label": "Whole Exome Sequencing", 
            "doc": "Whole Exome Sequence analysis using GATK best practices - Germline SNP & Indel Discovery\n", 
            "requirements": [
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "SubworkflowFeatureRequirement"
                }, 
                {
                    "$import": "#bespin-types.yml"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "id": "#main/GATKJar"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "id": "#main/indel_resource_mills"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#main/interval_padding"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "id": "#main/intervals"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "id": "#main/knownSites"
                }, 
                {
                    "type": "string", 
                    "id": "#main/library"
                }, 
                {
                    "type": "string", 
                    "id": "#main/platform"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "id": "#main/primary_intervals"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "#bespin-types.yml/NamedFASTQFilePairType"
                    }, 
                    "id": "#main/read_pairs"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".amb", 
                        ".ann", 
                        ".bwt", 
                        ".pac", 
                        ".sa", 
                        ".fai", 
                        "^.dict"
                    ], 
                    "id": "#main/reference_genome"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "id": "#main/resource_dbsnp"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "id": "#main/snp_resource_1kg"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "id": "#main/snp_resource_hapmap"
                }, 
                {
                    "type": "File", 
                    "secondaryFiles": [
                        ".idx"
                    ], 
                    "id": "#main/snp_resource_omni"
                }, 
                {
                    "type": "#bespin-types.yml/ExomeseqStudyType", 
                    "id": "#main/study_type"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#main/threads"
                }
            ], 
            "outputs": [
                {
                    "type": "Directory", 
                    "outputSource": "#main/organize_directories/bams_final_dir", 
                    "doc": "BAM files containing assembled haplotypes and locally realigned reads", 
                    "id": "#main/bams_final_dir"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#main/organize_directories/bams_markduplicates_dir", 
                    "doc": "BAM and bai files from markduplicates", 
                    "id": "#main/bams_markduplicates_dir"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#main/organize_directories/fastqc_reports_dir", 
                    "id": "#main/fastqc_reports_dir"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/variant_discovery/variant_recalibration_snps_indels_vcf", 
                    "doc": "The output filtered and recalibrated VCF file in which each variant is annotated with its VQSLOD value", 
                    "id": "#main/filtered_recalibrated_variants"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#main/organize_directories/hs_metrics_dir", 
                    "id": "#main/hs_metrics_dir"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/variant_discovery/joint_raw_variants", 
                    "doc": "GVCF file from joint genotyping calling", 
                    "id": "#main/joint_raw_variants"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#main/organize_directories/raw_variants_dir", 
                    "id": "#main/raw_variants_dir"
                }, 
                {
                    "type": "Directory", 
                    "outputSource": "#main/organize_directories/trim_reports_dir", 
                    "id": "#main/trim_reports_dir"
                }
            ], 
            "steps": [
                {
                    "run": "#exomeseq-03-organizedirectories.cwl", 
                    "in": [
                        {
                            "source": "#main/preprocessing/haplotypes_bam", 
                            "id": "#main/organize_directories/bams_final"
                        }, 
                        {
                            "source": "#main/preprocessing/markduplicates_bam", 
                            "id": "#main/organize_directories/bams_markduplicates"
                        }, 
                        {
                            "source": "#main/preprocessing/fastqc_reports", 
                            "id": "#main/organize_directories/fastqc_reports"
                        }, 
                        {
                            "source": "#main/preprocessing/hs_metrics", 
                            "id": "#main/organize_directories/hs_metrics"
                        }, 
                        {
                            "source": "#main/preprocessing/raw_variants", 
                            "id": "#main/organize_directories/raw_variants"
                        }, 
                        {
                            "source": "#main/preprocessing/trim_reports", 
                            "id": "#main/organize_directories/trim_reports"
                        }
                    ], 
                    "out": [
                        "#main/organize_directories/fastqc_reports_dir", 
                        "#main/organize_directories/trim_reports_dir", 
                        "#main/organize_directories/hs_metrics_dir", 
                        "#main/organize_directories/bams_markduplicates_dir", 
                        "#main/organize_directories/raw_variants_dir", 
                        "#main/organize_directories/bams_final_dir"
                    ], 
                    "id": "#main/organize_directories"
                }, 
                {
                    "run": "#exomeseq-00-prepare-reference-data.cwl", 
                    "in": [
                        {
                            "source": "#main/intervals", 
                            "id": "#main/prepare_reference_data/intervals"
                        }, 
                        {
                            "source": "#main/primary_intervals", 
                            "id": "#main/prepare_reference_data/primary_intervals"
                        }, 
                        {
                            "source": "#main/reference_genome", 
                            "id": "#main/prepare_reference_data/reference_genome"
                        }
                    ], 
                    "out": [
                        "#main/prepare_reference_data/target_interval_list", 
                        "#main/prepare_reference_data/bait_interval_list"
                    ], 
                    "id": "#main/prepare_reference_data"
                }, 
                {
                    "run": "#exomeseq-01-preprocessing.cwl", 
                    "scatter": "#main/preprocessing/read_pair", 
                    "in": [
                        {
                            "source": "#main/GATKJar", 
                            "id": "#main/preprocessing/GATKJar"
                        }, 
                        {
                            "source": "#main/prepare_reference_data/bait_interval_list", 
                            "id": "#main/preprocessing/bait_interval_list"
                        }, 
                        {
                            "source": "#main/interval_padding", 
                            "id": "#main/preprocessing/interval_padding"
                        }, 
                        {
                            "source": "#main/intervals", 
                            "id": "#main/preprocessing/intervals"
                        }, 
                        {
                            "source": "#main/knownSites", 
                            "id": "#main/preprocessing/knownSites"
                        }, 
                        {
                            "source": "#main/library", 
                            "id": "#main/preprocessing/library"
                        }, 
                        {
                            "source": "#main/platform", 
                            "id": "#main/preprocessing/platform"
                        }, 
                        {
                            "source": "#main/primary_intervals", 
                            "id": "#main/preprocessing/primary_intervals"
                        }, 
                        {
                            "source": "#main/read_pairs", 
                            "id": "#main/preprocessing/read_pair"
                        }, 
                        {
                            "source": "#main/reference_genome", 
                            "id": "#main/preprocessing/reference_genome"
                        }, 
                        {
                            "source": "#main/resource_dbsnp", 
                            "id": "#main/preprocessing/resource_dbsnp"
                        }, 
                        {
                            "source": "#main/prepare_reference_data/target_interval_list", 
                            "id": "#main/preprocessing/target_interval_list"
                        }, 
                        {
                            "source": "#main/threads", 
                            "id": "#main/preprocessing/threads"
                        }
                    ], 
                    "out": [
                        "#main/preprocessing/fastqc_reports", 
                        "#main/preprocessing/trim_reports", 
                        "#main/preprocessing/markduplicates_bam", 
                        "#main/preprocessing/recalibration_table", 
                        "#main/preprocessing/recalibrated_reads", 
                        "#main/preprocessing/raw_variants", 
                        "#main/preprocessing/haplotypes_bam", 
                        "#main/preprocessing/hs_metrics"
                    ], 
                    "id": "#main/preprocessing"
                }, 
                {
                    "run": "#exomeseq-02-variantdiscovery.cwl", 
                    "in": [
                        {
                            "source": "#main/GATKJar", 
                            "id": "#main/variant_discovery/GATKJar"
                        }, 
                        {
                            "source": "#main/indel_resource_mills", 
                            "id": "#main/variant_discovery/indel_resource_mills"
                        }, 
                        {
                            "source": "#main/interval_padding", 
                            "id": "#main/variant_discovery/interval_padding"
                        }, 
                        {
                            "source": "#main/intervals", 
                            "id": "#main/variant_discovery/intervals"
                        }, 
                        {
                            "source": "#main/library", 
                            "id": "#main/variant_discovery/name"
                        }, 
                        {
                            "source": "#main/preprocessing/raw_variants", 
                            "id": "#main/variant_discovery/raw_variants"
                        }, 
                        {
                            "source": "#main/reference_genome", 
                            "id": "#main/variant_discovery/reference_genome"
                        }, 
                        {
                            "source": "#main/resource_dbsnp", 
                            "id": "#main/variant_discovery/resource_dbsnp"
                        }, 
                        {
                            "source": "#main/snp_resource_1kg", 
                            "id": "#main/variant_discovery/snp_resource_1kg"
                        }, 
                        {
                            "source": "#main/snp_resource_hapmap", 
                            "id": "#main/variant_discovery/snp_resource_hapmap"
                        }, 
                        {
                            "source": "#main/snp_resource_omni", 
                            "id": "#main/variant_discovery/snp_resource_omni"
                        }, 
                        {
                            "source": "#main/study_type", 
                            "id": "#main/variant_discovery/study_type"
                        }, 
                        {
                            "source": "#main/threads", 
                            "id": "#main/variant_discovery/threads"
                        }
                    ], 
                    "out": [
                        "#main/variant_discovery/joint_raw_variants", 
                        "#main/variant_discovery/variant_recalibration_snps_tranches", 
                        "#main/variant_discovery/variant_recalibration_snps_recal", 
                        "#main/variant_discovery/variant_recalibration_snps_rscript", 
                        "#main/variant_discovery/variant_recalibration_snps_vcf", 
                        "#main/variant_discovery/variant_recalibration_snps_indels_tranches", 
                        "#main/variant_discovery/variant_recalibration_snps_indels_recal", 
                        "#main/variant_discovery/variant_recalibration_snps_indels_rscript", 
                        "#main/variant_discovery/variant_recalibration_snps_indels_vcf"
                    ], 
                    "id": "#main/variant_discovery"
                }
            ], 
            "id": "#main"
        }
    ]
}