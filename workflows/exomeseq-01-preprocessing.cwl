#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  # NOTE: How long is this expected to take?
  # For testing, intervals on reference genome
  intervals: string[]?
  # Read samples, fastq format
  # NOTE: Broad recommends the illumina basecalls and converts to unmapped SAM
  #   but do we typically have fastq?
  reads: File[]
  # reference genome, fasta
  # NOTE: GATK can't handle compressed fasta reference genome
  # NOTE: is b37 appropriate to use?
  # NOTE: Indexed with bwa and avoided .64 files
  # NOTE: For mapping, they recommend a merge step, but this may only apply to having raw basecalls
  reference_genome: File
  # Number of threads to use
  threads: int?
  # Read Group annotation
  # NOTE: Does each sample get a read group?
  read_group_library: string
  read_group_sample_name: string
  read_group_platform: string
  read_group_platform_unit: string
  # GATK
  GATKJar: File
  knownSites: File[] # vcf files of known sites, with indexing
outputs:
  qc_reports:
    type: File[]
    outputSource: qc/output_qc_report
  trimmed_reads:
    type: File[]
    outputSource: trim/trimmed_reads
  trim_reports:
    type: File[]
    outputSource: trim/trim_reports
  mapped:
    type: File
    outputSource: map/output
  mapped_sorted:
    type: File
    outputSource: sort/sorted
  duplicate_metrics:
    type: File
    outputSource: mark_duplicates/output_metrics_file
  deduplicated:
    type: File
    outputSource: mark_duplicates/output_dedup_bam_file
  with_read_groups:
    type: File
    outputSource: add_read_groups/output
  # Recalibration
  recalibration_before:
    type: File
    outputSource: recalibrate_01_analyze/output_baseRecalibrator
  recalibration_after:
    type: File
    outputSource: recalibrate_02_covariation/output_baseRecalibrator
  recalibration_plots:
    type: File
    outputSource: recalibrate_03_plots/output_recalibrationPlots
  recalibrated_reads:
    type: File
    outputSource: recalibrate_04_apply/output_printReads
steps:
  qc:
    run: ../tools/fastqc.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 4
        ramMin: 2500
    scatter: input_fastq_file
    in:
      input_fastq_file: reads
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
      reads: reads
      paired:
        default: true
    out:
      - trimmed_reads
      - trim_reports
  map:
    run: ../community-workflows/tools/bwa-mem.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 8
        ramMin: 16000
    in:
      reads: trim/trimmed_reads
      reference: reference_genome
      output_filename:
        default: "mapped.bam"
      threads: threads
    out:
      - output
  sort:
    # TODO: Can bwa-mem sort?
    # TODO: Does picard support threads?
    run: ../tools/picard-SortSam.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
    in:
      input_file: map/output
    out:
      - sorted
  mark_duplicates:
    # TODO: Does picard support threads?
    run: ../tools/picard-MarkDuplicates.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
    in:
      input_file: sort/sorted
    out:
      - output_metrics_file
      - output_dedup_bam_file
  add_read_groups:
    run: ../tools/picard-AddOrReplaceReadGroups.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
    in:
      read_group_library: read_group_library
      read_group_sample_name: read_group_sample_name
      read_group_platform: read_group_platform
      read_group_platform_unit: read_group_platform_unit
      input_file: mark_duplicates/output_dedup_bam_file
    out:
      - output # Includes a bai index by default
  # Now recalibrate
  recalibrate_01_analyze:
    run: ../community-workflows/tools/GATK-BaseRecalibrator.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
    in:
      GATKJar: GATKJar
      inputBam_BaseRecalibrator: add_read_groups/output
      intervals: intervals
      knownSites: knownSites
      outputfile_BaseRecalibrator:
        default: "recal_data.table"
      reference: reference_genome
    out:
      - output_baseRecalibrator
  recalibrate_02_covariation:
    run: ../community-workflows/tools/GATK-BaseRecalibrator.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
    in:
      GATKJar: GATKJar
      inputBam_BaseRecalibrator: add_read_groups/output
      intervals: intervals
      knownSites: knownSites
      bqsr: recalibrate_01_analyze/output_baseRecalibrator
      outputfile_BaseRecalibrator:
        default: "post_recal_data.table"
      reference: reference_genome
    out:
      - output_baseRecalibrator
  recalibrate_03_plots:
    run: ../community-workflows/tools/GATK-AnalyzeCovariates.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
    in:
      GATKJar: GATKJar
      inputBam_BaseRecalibrator: add_read_groups/output
      intervals: intervals
      inputTable_before: recalibrate_01_analyze/output_baseRecalibrator
      inputTable_after: recalibrate_02_covariation/output_baseRecalibrator
      outputfile_recalibrationPlots:
        default: "recalibration_plots.pdf"
      reference: reference_genome
    out:
      - output_recalibrationPlots
  recalibrate_04_apply:
    run: ../community-workflows/tools/GATK-PrintReads.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 2500
    in:
      GATKJar: GATKJar
      inputBam_printReads: add_read_groups/output
      intervals: intervals
      input_baseRecalibrator: recalibrate_01_analyze/output_baseRecalibrator
      outputfile_printReads:
        default: "recal_reads.bam"
      reference: reference_genome
    out:
      - output_printReads
