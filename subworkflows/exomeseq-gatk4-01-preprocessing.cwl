#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
  - $import: ../types/bespin-types.yml
inputs:
  # NOTE: How long is this expected to take?
  # Intervals should come from capture kit in bed format
  intervals: File[]?
  # target intervals in picard interval_list format (created from intervals bed file)
  target_interval_list: File
  # bait intervals in picard interval_list format
  bait_interval_list: File
  interval_padding: int?
  # Read samples, fastq format
  # NOTE: Broad recommends the illumina basecalls and converts to unmapped SAM
  #   but do we typically have fastq?
  read_pair:
    type: ../types/bespin-types.yml#FASTQReadPairType
  # reference genome, fasta
  # NOTE: GATK can't handle compressed fasta reference genome
  # NOTE: is b37 appropriate to use?
  # NOTE: Indexed with bwa and avoided .64 files
  # NOTE: For mapping, they recommend a merge step, but this may only apply to having raw basecalls
  reference_genome: File
  # Number of threads to use for mapping
  threads: int
  # Read Group annotations
  # Can be the project name
  library: string
  # e.g. Illumina
  platform: string
  known_sites: File[] # vcf files of known sites, with indexing
  # Variant Recalibration - Common
  resource_dbsnp: File
outputs:
  fastqc_reports:
    type: File[]
    outputSource: qc/output_qc_report
  trim_reports:
    type: File[]
    outputSource: trim/trim_reports
  markduplicates_bam:
    type: File
    outputSource: mark_duplicates/output_dedup_bam_file
  # Recalibration
  recalibration_table:
    type: File
    outputSource: recalibrate_01_analyze/output_recalibration_report
  recalibrated_reads:
    type: File
    outputSource: recalibrate_02_apply_bqsr/output_recalibrated_bam

steps:
  file_pair_details:
    run: ../tools/extract-named-file-pair-details.cwl
    in:
       read_pair: read_pair
       library: library
       platform: platform
    out:
       - reads
       - read_pair_name
       - read_group_header
  generate_sample_filenames:
    run: ../tools/generate-sample-filenames.cwl
    in:
      sample_name: file_pair_details/read_pair_name
    out:
      - combined_reads_output_filenames
      - mapped_reads_output_filename
      - sorted_reads_output_filename
      - dedup_reads_output_filename
      - dedup_metrics_output_filename
      - recal_reads_output_filename
      - recal_table_output_filename
      - raw_variants_output_filename
      - haplotypes_bam_output_filename
      - fixedtag_reads_output_filename
  combine_reads:
    run: ../tools/concat-gz-files.cwl
    scatter: [files, output_filename]
    scatterMethod: dotproduct
    in:
       files: file_pair_details/reads
       output_filename: generate_sample_filenames/combined_reads_output_filenames
    out:
       - output
  qc:
    run: ../tools/fastqc.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 4
        ramMin: 2500
    scatter: input_fastq_file
    in:
      input_fastq_file: combine_reads/output
      threads:
        default: 4
    out:
      - output_qc_report
  trim:
    run: ../tools/trim_galore.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 4
        ramMin: 8000
    in:
      reads: combine_reads/output
      paired:
        default: true
    out:
      - trimmed_reads
      - trim_reports
  map:
    run: ../tools/gotc-bwa-mem-samtools.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: $(inputs.threads)
        ramMin: 16000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      reads: trim/trimmed_reads
      reference: reference_genome
      read_group_header: file_pair_details/read_group_header
      output_filename: generate_sample_filenames/mapped_reads_output_filename
      threads: threads
    out:
      - output
  mark_duplicates: # I thought this needed to be sorted but apparently not?
    run: ../tools/GATK4-MarkDuplicates.cwl
    requirements:
      - class: ResourceRequirement
        ramMin: 7000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      input_file: map/output
      output_filename: generate_sample_filenames/dedup_reads_output_filename
      metrics_filename: generate_sample_filenames/dedup_metrics_output_filename
      validation_stringency: { default: "SILENT" }
      assume_sort_order: { default: "queryname" }
      optical_duplicate_pixel_distance: { default: 2500 }
      java_opt: { default: "-Xms4000m" }
    out:
      - output_dedup_bam_file
      - output_metrics_file
  sort:
    run: ../tools/GATK4-SortSam.cwl
    requirements:
      - class: ResourceRequirement
        ramMin: 5000
    in:
      input_file: mark_duplicates/output_dedup_bam_file
      output_sorted_bam_filename: generate_sample_filenames/sorted_reads_output_filename
      sort_order: { default: "coordinate" }
      java_opt: { default: "-Xms4000m" }
    out:
      - output_sorted_bam
  fixtags:
    run: ../tools/GATK4-SetNmAndUqTags.cwl # what does this do?
    requirements:
      - class: ResourceRequirement
        ramMin: 1000
    in:
      input_file: sort/output_sorted_bam
      output_filename: generate_sample_filenames/fixedtag_reads_output_filename
      reference: reference_genome
      java_opt: { default: "-Xms500m" }   
    out:
      - output_fixed_tags_bam
  # Now recalibrate
  recalibrate_01_analyze:
    run: ../tools/GATK4-BaseRecalibrator.cwl
    requirements:
      - class: ResourceRequirement
        ramMin: 6000
    in:
      reference: reference_genome
      input_bam: fixtags/output_fixed_tags_bam
      use_original_qualities: { default: true }
      output_recalibration_report_filename: generate_sample_filenames/recal_table_output_filename
      known_sites: known_sites
      intervals: intervals
      java_opt: { default: "-Xms4000m" }
    out:
      - output_recalibration_report
  recalibrate_02_apply_bqsr:
    run: ../tools/GATK4-ApplyBQSR.cwl
    requirements:
      - class: ResourceRequirement
        ramMin: 3500
    in:
      reference: reference_genome
      input_bam: fixtags/output_fixed_tags_bam
      output_recalibrated_bam_filename: generate_sample_filenames/recal_reads_output_filename
      intervals: intervals
      bqsr_report: recalibrate_01_analyze/output_recalibration_report
      static_quantized_quals: { default: [10, 20, 30]}
      add_output_sam_program_record: { default: true }
      use_original_qualities: { default: true }
      java_opt: { default: "-Xms3000m" }
    out:
      - output_recalibrated_bam

