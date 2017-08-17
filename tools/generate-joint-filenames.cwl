#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Generates a set of file names for joint steps based on an input name
requirements:
  - class: InlineJavascriptRequirement

inputs:
  name: string
outputs:
  joint_genotype_raw_variants_output_filename: string
  snps_vqsr_recal_output_filename: string
  snps_vqsr_tranches_output_filename: string
  snps_vqsr_rscript_output_filename: string
  snps_recalibrated_output_filename: string
  indels_vqsr_recal_output_filename: string
  indels_vqsr_tranches_output_filename: string
  indels_vqsr_rscript_output_filename: string
  indels_recalibrated_output_filename: string

expression: >
  ${
    function makeFilename(base, suffix, extension) {
      return base + '-' + suffix + '.' + extension;
    }
    var base = inputs.name

    return {
      joint_genotype_raw_variants_output_filename: makeFilename(base, 'raw_variants', 'g.vcf'),
      snps_vqsr_recal_output_filename: makeFilename(base, 'snps_vqsr_recal', 'out'),
      snps_vqsr_tranches_output_filename: makeFilename(base, 'snps_vqsr_tranches', 'out'),
      snps_vqsr_rscript_output_filename: makeFilename(base, 'snps_vqsr', 'R'),
      snps_recalibrated_output_filename: makeFilename(base, 'snps_recalibrated', 'vcf'),
      indels_vqsr_recal_output_filename: makeFilename(base, 'indels_vqsr_recal', 'out'),
      indels_vqsr_tranches_output_filename: makeFilename(base, 'indels_vqsr_tranches', 'out'),
      indels_vqsr_rscript_output_filename: makeFilename(base, 'indels_vqsr', 'R'),
      indels_recalibrated_output_filename: makeFilename(base, 'indels_recalibrated', 'vcf')
    };
  }
