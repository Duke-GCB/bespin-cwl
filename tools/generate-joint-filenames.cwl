#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Generates a set of file names for joint steps based on an input name
requirements:
  - class: InlineJavascriptRequirement
inputs:
  name: string
outputs:
  raw_variants_filename: string
  snps_recalibration_filename: string
  snps_tranches_filename: string
  snps_recalibrated_variants_filename: string
  indels_recalibration_filename: string
  indels_tranches_filename: string
  indels_recalibrated_variants_filename: string
  combined_recalibrated_variants_filename: string
expression: >
  ${
    function makeFilename(base, suffix, extension) {
      return base + '-' + suffix + '.' + extension;
    }
    var base = inputs.name

    return {
      raw_variants_filename: makeFilename(base, 'raw_variants', 'g.vcf'),
      snps_recalibration_filename: makeFilename(base, 'snps_recal', 'out'),
      snps_tranches_filename: makeFilename(base, 'snps_tranches', 'out'),
      snps_recalibrated_variants_filename: makeFilename(base, 'snps_recal_variants', 'vcf'),
      indels_recalibration_filename: makeFilename(base, 'indels_recal', 'out'),
      indels_tranches_filename: makeFilename(base, 'indels_tranches', 'out'),
      indels_recalibrated_variants_filename: makeFilename(base, 'indels_recal_variants', 'vcf'),
      combined_recalibrated_variants_filename: makeFilename(base, 'indels_snps_recal_variants', 'vcf')
    };
  }
