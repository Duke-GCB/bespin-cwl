#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
  - $import: ../types/bespin-types.yml
inputs:
  # NOTE: How long is this expected to take?
  # Intervals should come from capture kit (target intervals) bed format
  intervals: File[]?
  # Intervals should come from capture kit (bait intervals) bed format
  primary_intervals: File[]?
  interval_padding: int?
  # Read samples, fastq format
  # NOTE: Broad recommends the illumina basecalls and converts to unmapped SAM
  #   but do we typically have fastq?
  read_pair:
    type: ../types/bespin-types.yml#NamedFASTQFilePairType
  # reference genome, fasta
  # NOTE: GATK can't handle compressed fasta reference genome
  # NOTE: is b37 appropriate to use?
  # NOTE: Indexed with bwa and avoided .64 files
  # NOTE: For mapping, they recommend a merge step, but this may only apply to having raw basecalls
  reference_genome: File
  # Number of threads to use for mapping
  threads: int?
  # Read Group annotations
  # Can be the project name
  library: string
  # e.g. Illumina
  platform: string
  # Must include "sample" at minimum
  field_order: string[]?
  # GATK
  GATKJar: File
  knownSites: File[] # vcf files of known sites, with indexing
  # Variant Recalibration - Common
  resource_dbsnp: File
outputs:
  fastqc_reports:
    type: File[]
    outputSource: qc/output_qc_report
  hs_metrics:
    type: File
    outputSource: collect_hs_metrics/output_hs_metrics_file
  trim_reports:
    type: File[]
    outputSource: trim/trim_reports
  markduplicates_bam:
    type: File
    outputSource: mark_duplicates/output_dedup_bam_file
  # Recalibration
  recalibration_table:
    type: File
    outputSource: recalibrate_01_analyze/output_baseRecalibrator
  recalibrated_reads:
    type: File
    outputSource: recalibrate_02_apply/output_printReads
  raw_variants:
    type: File
    outputSource: variant_calling/output_HaplotypeCaller
    doc: "VCF file from per sample variant calling"
  haplotypes_bam:
    type: File
    outputSource: variant_calling/output_HaplotypesBam
    doc: "BAM file containing assembled haplotypes and locally realigned reads"

steps:
  flatten_read_pair:
    run: ../tools/flatten-named-file-pair.cwl
    in:
       read_pair: read_pair
    out:
       - reads
  qc:
    run: ../tools/fastqc.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 4
        ramMin: 2500
    scatter: input_fastq_file
    in:
      input_fastq_file: flatten_read_pair/reads
      threads: threads
    out:
      - output_qc_report
  trim:
    run: ../tools/trim_galore.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 4
        ramMin: 8000
    in:
      reads: flatten_read_pair/reads
      paired:
        default: true
    out:
      - trimmed_reads
      - trim_reports
  parse_read_group_header:
    run: ../tools/parse-read-group-header.cwl
    in:
      reads: flatten_read_pair/reads
      field_order: field_order
      library: library
      platform: platform
    out:
      - read_group_header
      - sample_name
  generate_sample_filenames:
    run: ../tools/generate-sample-filenames.cwl
    in:
      sample_name: parse_read_group_header/sample_name
    out:
      - mapped_reads_output_filename
      - sorted_reads_output_filename
      - dedup_reads_output_filename
      - dedup_metrics_output_filename
      - recal_reads_output_filename
      - recal_table_output_filename
      - raw_variants_output_filename
      - haplotypes_bam_output_filename
      - hs_metrics_output_filename
  map:
    run: ../tools/bwa-mem-samtools.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 8
        ramMin: 16000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      reads: trim/trimmed_reads
      reference: reference_genome
      read_group_header: parse_read_group_header/read_group_header
      output_filename: generate_sample_filenames/mapped_reads_output_filename
      threads: threads
    out:
      - output
  sort:
    run: ../tools/picard-SortSam.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 4000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      input_file: map/output
      output_filename: generate_sample_filenames/sorted_reads_output_filename
    out:
      - sorted
  mark_duplicates:
    run: ../tools/picard-MarkDuplicates.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 4000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      input_file: sort/sorted
      output_filename: generate_sample_filenames/dedup_reads_output_filename
      metrics_filename: generate_sample_filenames/dedup_metrics_output_filename
    out:
      - output_dedup_bam_file
      - output_metrics_file
  make_target_interval_list:
    run: ../tools/picard-BedToIntervalList.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 4000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      input_file: intervals
      reference_sequence: reference_genome
    out:
      - output_interval_list_file
  make_bait_interval_list:
    run: ../tools/picard-BedToIntervalList.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 4000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      input_file: primary_intervals
      reference_sequence: reference_genome
    out:
      - output_interval_list_file
  collect_hs_metrics:
    run: ../tools/picard-CollectHsMetrics.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 4000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      input_file: mark_duplicates/output_dedup_bam_file
      reference_sequence: reference_genome
      target_intervals: make_target_interval_list/output_interval_list_file
      bait_intervals: make_bait_interval_list/output_interval_list_file
      output_filename: generate_sample_filenames/hs_metrics_output_filename
    out:
      - output_hs_metrics_file
  # Now recalibrate
  recalibrate_01_analyze:
    run: ../tools/GATK-BaseRecalibrator.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 8
        ramMin: 4096
    in:
      GATKJar: GATKJar
      inputBam_BaseRecalibrator: mark_duplicates/output_dedup_bam_file
      intervals: intervals
      interval_padding: interval_padding
      knownSites: knownSites
      cpu_threads:
        default: 8
      outputfile_BaseRecalibrator: generate_sample_filenames/recal_table_output_filename
      reference: reference_genome
    out:
      - output_baseRecalibrator
  recalibrate_02_apply:
    run: ../tools/GATK-PrintReads.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 8
        ramMin: 4096
    in:
      GATKJar: GATKJar
      inputBam_printReads: mark_duplicates/output_dedup_bam_file
      intervals: intervals
      input_baseRecalibrator: recalibrate_01_analyze/output_baseRecalibrator
      cpu_threads:
        default: 8
      outputfile_printReads: generate_sample_filenames/recal_reads_output_filename
      reference: reference_genome
    out:
      - output_printReads
  variant_calling:
    run: ../tools/GATK-HaplotypeCaller.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 16384
    in:
      GATKJar: GATKJar
      inputBam_HaplotypeCaller: recalibrate_02_apply/output_printReads
      intervals: intervals
      interval_padding: interval_padding
      reference: reference_genome
      group:
        default: ['StandardAnnotation','AS_StandardAnnotation']
      dbsnp: resource_dbsnp
      emitRefConfidence:
        default: "GVCF"
      outputfile_HaplotypeCaller: generate_sample_filenames/raw_variants_output_filename
      bamOutput: generate_sample_filenames/haplotypes_bam_output_filename
        # Naming your output file using the .g.vcf extension will automatically set the appropriate values  for --variant_index_type and --variant_index_parameter
    out:
      - output_HaplotypeCaller
      - output_HaplotypesBam
