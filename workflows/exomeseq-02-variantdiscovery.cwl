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
  # Variant Recalibration - Common
  resource_dbsnp: File
  # Variant Recalibration - Indels
  indel_resource_mills: File

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
    # TODO: Update this doc
    doc: "SNP Tranches file TBD"
  variant_recalibration_snps_recal:
    type: File
    outputSource: variant_recalibration_snps/recal_File
    # TODO: Update this doc
    doc: "SNP Recal file TBD"
  variant_recalibration_snps_rscript:
    type: File
    outputSource: variant_recalibration_snps/vqsr_rscript
    # TODO: Update this doc
    doc: "SNP VQSR Rscript"
  variant_recalibration_indels_tranches:
    type: File
    outputSource: variant_recalibration_indels/tranches_File
    # TODO: Update this doc
    doc: "Indel Tranches file TBD"
  variant_recalibration_indels_recal:
    type: File
    outputSource: variant_recalibration_indels/recal_File
    # TODO: Update this doc
    doc: "Indel Recal file TBD"
  variant_recalibration_indels_rscript:
    type: File
    outputSource: variant_recalibration_indels/vqsr_rscript
    # TODO: Update this doc
    doc: "Indel VQSR Rscript"
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
  # TODO: At this point, should merge VCFs if we had lots of them
  # See Merge (optional) on https://software.broadinstitute.org/gatk/best-practices/bp_3step.php?case=GermShortWGS&p=2
  joint_genotyping:
    run: ../community-workflows/tools/GATK-GenotypeGVCFs.cwl
    in:
      GATKJar: GATKJar
      threads: threads
      intervals: intervals
      # NOTE: GATK best practices recommends at least 30 samples for exome - how to deal?
      variants: variant_calling/output_HaplotypeCaller
      reference: reference_genome
      outputfile_GenotypeGVCFs:
        default: "joint_genotype_raw_variants.g.vcf"
    out:
      - output_GenotypeGVCFs
  # Recommendations from https://software.broadinstitute.org/gatk/documentation/article?id=1259
  variant_recalibration_snps:
    run: ../community-workflows/tools/GATK-VariantRecalibrator-SNPs.cwl
    in:
      GATKJar: GATKJar
      intervals: intervals
      reference: reference_genome
      haplotypecaller_snps_vcf: joint_genotyping/output_GenotypeGVCFs
      threads: threads
      outputfile_recal:
        default: "snps_vqsr_recal.out"
      outputfile_tranches:
        default: "snps_vqsr_tranches.out"
      outputfile_rscript:
        default: "snps_vqsr.R"
      resource_hapmap: snp_resource_hapmap
      resource_omni: snp_resource_omni
      resource_1kg: snp_resource_1kg
      resource_dbsnp: resource_dbsnp
      # annotations, See https://software.broadinstitute.org/gatk/documentation/article?id=1259
      # Removed DP and InbreedingCoeff
      # Please note that these recommendations are formulated for whole-genome datasets.
      # For exomes, we do not recommend using DP for variant recalibration (see below for details of why).
      annotations:
        # The InbreedingCoeff is a population level statistic that requires at least 10 samples in order to be computed. For projects with fewer samples, or that includes many closely related samples (such as a family) please omit this annotation from the command line.
        # NOTE: InbreedingCoeff would need to be annotated separately
        default: ["QD","MQ","MQRankSum","ReadPosRankSum","FS","SOR"]
    out:
      - tranches_File
      - recal_File
      - vqsr_rscript
  variant_recalibration_indels:
    run: ../community-workflows/tools/GATK-VariantRecalibrator-Indels.cwl
    in:
      GATKJar: GATKJar
      intervals: intervals
      reference: reference_genome
      haplotypecaller_snps_vcf: joint_genotyping/output_GenotypeGVCFs
      threads: threads
      outputfile_recal:
        default: "indels_vqsr_recal.out"
      outputfile_tranches:
        default: "indels_vqsr_tranches.out"
      outputfile_rscript:
        default: "indels_vqsr.R"
      resource_mills: indel_resource_mills
      resource_dbsnp: resource_dbsnp
      # annotations, See https://software.broadinstitute.org/gatk/documentation/article?id=1259
      # Removed DP and InbreedingCoeff
      # Please note that these recommendations are formulated for whole-genome datasets.
      # For exomes, we do not recommend using DP for variant recalibration (see below for details of why).
      annotations:
        # The InbreedingCoeff is a population level statistic that requires at least 10 samples in order to be computed. For projects with fewer samples, or that includes many closely related samples (such as a family) please omit this annotation from the command line.
        # NOTE: InbreedingCoeff would need to be annotated separately
                default: ["QD","FS","SOR","ReadPosRankSum","MQRankSum"]
    out:
      - tranches_File
      - recal_File
      - vqsr_rscript
# Next, apply the recals

