#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Generates a set of file names for preprocessing steps based on an input sample name
requirements:
  - class: InlineJavascriptRequirement

inputs:
  sample_name: string
outputs:
  mapped_reads_output_filename: string
  sorted_reads_output_filename: string
  dedup_reads_output_filename: string
  dedup_metrics_output_filename: string
  recal_reads_output_filename: string
  recal_table_output_filename: string
  raw_variants_output_filename: string
  hs_metrics_output_filename: string

expression: >
  ${
    function makeFilename(base, suffix, extension) {
      return base + '-' + suffix + '.' + extension;
    }
    var base = inputs.sample_name

    return {
      mapped_reads_output_filename: makeFilename(base, 'mapped', 'bam'),
      sorted_reads_output_filename: makeFilename(base, 'sorted', 'bam'),
      dedup_reads_output_filename: makeFilename(base, 'dedup', 'bam'),
      dedup_metrics_output_filename: makeFilename(base, 'dedup-metrics', 'out'),
      recal_reads_output_filename: makeFilename(base, 'recal', 'bam'),
      recal_table_output_filename: makeFilename(base, 'recal', 'table'),
      raw_variants_output_filename: makeFilename(base, 'raw_variants', 'g.vcf'),
      hs_metrics_output_filename: makeFilename(base, 'hs', 'txt')
    };
  }
