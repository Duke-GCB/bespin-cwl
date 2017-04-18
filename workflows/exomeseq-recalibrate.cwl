cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  input_bam: File
  reference_genome: File
  # GATK
  GATKJar: File
  knownSites: File[] # vcf files of known sites, with indexing
  intervals: string[]?
outputs:
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
  recalibrate_01_analyze:
    run: ../community-workflows/tools/GATK-BaseRecalibrator.cwl
    in:
      GATKJar: GATKJar
      inputBam_BaseRecalibrator: input_bam
      intervals: intervals
      knownSites: knownSites
      outputfile_BaseRecalibrator:
        default: "recal_data.table"
      reference: reference_genome
    out:
      - output_baseRecalibrator
  recalibrate_02_covariation:
    run: ../community-workflows/tools/GATK-BaseRecalibrator.cwl
    in:
      GATKJar: GATKJar
      inputBam_BaseRecalibrator: input_bam
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
    in:
      GATKJar: GATKJar
      inputBam_BaseRecalibrator: input_bam
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
    in:
      GATKJar: GATKJar
      inputBam_printReads: input_bam
      intervals: intervals
      input_baseRecalibrator: recalibrate_01_analyze/output_baseRecalibrator
      outputfile_printReads:
        default: "recal_reads.bam"
      reference: reference_genome
    out:
      - output_printReads
