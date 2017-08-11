#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
doc: "Star/HTSeq RNA Seq Pipeline"
requirements:
  - class: ScatterFeatureRequirement
inputs:
  reads:
    type: File[]
    doc: "Sequences to be mapped (e.g. RNA-seq FASTQ files)"
  gff_file:
    type: File
    doc: "Genomic features in the GFF format"
  ref_gene_model:
    type: File
    doc: "Reference gene model in bed format"
  star_genome:
    type: Directory
    doc: "Genome directory containing STAR genome indices"
  threads:
    type: int
    doc: "Number of threads"
  align_out_prefix:
    type: string
    doc: "STAR output files name prefix"
outputs:
  qc_reports:
    type: File[]
    outputSource: qc/output_qc_report
    doc: "FastQC reports for input sequences"
  trim_reports:
    type: File[]
    outputSource: trim/trim_reports
    doc: "Trim Galore! summary reports"
  align_logs:
    type: File[]
    outputSource: align/logs
    doc: "STAR alignment log files"
  read_distribution_report:
    type: File
    outputSource: read_distribution/output
    doc: "RSeQC read distribution report"
  quantification_report:
    type: File
    outputSource: quantification/output
    doc: "HTSeq feature counts report"
  trimmed_reads:
    type: File[]
    outputSource: trim/trimmed_reads
    doc: "Input reads trimmed by Trim Galore!"
  aligned_read:
    type: File
    outputSource: align/aligned
    doc: "STAR alignments in SAM format"
  aligned_read_index:
    type: File
    outputSource: index/index
    doc: "BAM files indexed by samtools"
steps:
  qc:
    run: ../tools/fastqc.cwl
    scatter: input_fastq_file
    in:
      input_fastq_file: reads
      threads: threads
    out:
      - output_qc_report
  trim:
    run: ../tools/trim_galore.cwl
    in:
      reads: reads
      paired:
        default: true
    out:
      - trimmed_reads
      - trim_reports
  align:
    run: ../tools/STAR.cwl
    in:
      genomeDir: star_genome
      readFilesIn: trim/trimmed_reads
      runThreadN: threads
      outFilterMultimapNmax:
        default: 1
      outSAMattributes:
        default: "Standard"
      outSAMstrandField:
        default: "intronMotif"
      outSAMtype:
        default: ["BAM","SortedByCoordinate"]
      alignSJoverhangMin:
        default: 500
      outFileNamePrefix: align_out_prefix
    out:
      - aligned
      - logs
  index:
    run: ../tools/samtools-index.cwl
    in:
      input: align/aligned
      bai:
        default: true
    out:
      - index
  merge_index:
    run: ../tools/merge-secondary-file.cwl
    in:
      primary: align/aligned
      secondary: index/index
    out:
      - merged
  read_distribution:
    run: ../tools/read_distribution.cwl
    in:
      input: merge_index/merged
      ref_gene_model: ref_gene_model
    out:
      - output
  quantification:
    run: ../tools/htseq-count.cwl
    in:
      alignment_file: merge_index/merged
      gff_file: gff_file
      idattr:
        default: "Parent"
      stranded:
        default: "no"
      samtype:
        default: "bam"
      order:
        default: "pos"
    out:
      - output
