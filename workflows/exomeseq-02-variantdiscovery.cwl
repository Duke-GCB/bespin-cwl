#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
inputs:
  # For testing, intervals on reference genome
  intervals: string[]?
  # Read samples, fastq format
  recalibrated_reads: File[]
  # reference genome, fasta
  reference_genome: File
  # Number of threads to use
  threads: int?
  # GATK
  GATKJar: File
  # Variant calling
  # Confidence threshold for calling a variant - 30
  stand_call_conf: double
  # Variant Recalibration - SNPs
  snp_resource_hapmap: File
  snp_resource_omni: File
  snp_resource_1kg: File
  snp_resource_dbsnp: File

outputs:
  per_sample_raw_variants:
    type: File[]
    outputSource: variant_calling/output_HaplotypeCaller
    doc: "VCF files from per sample variant calling"
  joint_raw_variants:
    type: File
    outputSource: joint_genotyping/output_GenotypeGVCFs
    doc: "VCF files from joint genotyping calling"
  variant_recalibration_snps_tranches:
    type: File
    outputSource: variant_recalibration_snps/tranches_File
    doc: "Tranches file TBD"
  variant_recalibration_snps_recal:
    type: File
    outputSource: variant_recalibration_snps/recal_File
    doc: "Recal file TBD"
  variant_recalibration_snps_rscript:
    type: File
    outputSource: variant_recalibration_snps/vqsr_rscript
    doc: "VQSR Rscript"

steps:
  variant_calling:
    # Does not support multiple threads
    run: ../community-workflows/tools/GATK-HaplotypeCaller.cwl
    scatter: inputBam_HaplotypeCaller
    in:
      GATKJar: GATKJar
      inputBam_HaplotypeCaller: recalibrated_reads
      intervals: intervals
      reference: reference_genome
      genotyping_mode:
        default: "DISCOVERY"
      stand_call_conf: stand_call_conf
      emitRefConfidence:
        default: "GVCF"
      outputfile_HaplotypeCaller: #
        # Naming your output file using the .g.vcf extension will automatically set the appropriate values  for --variant_index_type and --variant_index_parameter
        default: "raw_variants.g.vcf"
    out:
      - output_HaplotypeCaller
  joint_genotyping:
    run: ../community-workflows/tools/GATK-GenotypeGVCFs.cwl
    in:
      GATKJar: GATKJar
      threads: threads
      intervals: intervals
      variants: variant_calling/output_HaplotypeCaller
      reference: reference_genome
      outputfile_GenotypeGVCFs:
        default: "joint_genotype_raw_variants.vcf"
    out:
      - output_GenotypeGVCFs
  variant_recalibration_snps:
    run: ../community-workflows/tools/GATK-VariantRecalibrator-SNPs.cwl
    in:
      GATKJar: GATKJar
      intervals: intervals
      reference: reference_genome
      haplotypecaller_snps_vcf: joint_genotyping/output_GenotypeGVCFs
      threads: threads
      outputfile_recal:
        default: "vqsr_recal.out"
      outputfile_tranches:
        default: "vqsr_tranches.out"
      outputfile_rscript:
        default: "vqsr.R"
      resource_hapmap: snp_resource_hapmap
      resource_omni: snp_resource_omni
      resource_1kg: snp_resource_1kg
      resource_dbsnp: snp_resource_dbsnp
      # annotations
      # Please note that these recommendations are formulated for whole-genome datasets.
      # For exomes, we do not recommend using DP for variant recalibration (see below for details of why).
      # https://software.broadinstitute.org/gatk/documentation/article?id=1259
      annotations:
        # Removed "InbreedingCoeff", would need to annotate this and only valid for >10 samples
        # http://gatkforums.broadinstitute.org/gatk/discussion/1406/error-values-for-inbreedingcoeff-annotation-not-detected-for-any-training-variant-in-the-input
        default: ["QD","MQ","MQRankSum","ReadPosRankSum","FS","SOR"]
    out:
      - tranches_File
      - recal_File
      - vqsr_rscript
