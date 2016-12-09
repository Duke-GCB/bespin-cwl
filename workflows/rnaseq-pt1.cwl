#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  reads: File[]
  gff_file: File
  ref_gene_model: File
  star_genome: Directory
  threads: int
  align_out_prefix: string
outputs:
  qc_reports:
    type: File[]
    outputSource: qc/output_qc_report
  trim_reports:
    type: File[]
    outputSource: trim/trim_reports
  align_logs:
    type: File[]
    outputSource: align/logs
  read_distribution_report:
    type: File
    outputSource: read_distribution/output
  quantification_report:
    type: File
    outputSource: quantification/output
  trimmed_reads:
    type: File[]
    outputSource: trim/reads
  aligned_read:
    type: File
    outputSource: align/aligned
  aligned_read_index:
    type: File
    outputSource: index/index
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
    run: ../community-workflows/tools/STAR.cwl
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
    run: ../community-workflows/tools/samtools-index.cwl
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
