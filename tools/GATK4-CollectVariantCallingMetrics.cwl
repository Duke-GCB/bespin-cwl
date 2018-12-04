#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  $import: GATK4-requirements.yml
hints:
  - $import: GATK4-hints.yml
baseCommand: gatk

inputs:
  input_vcf:
    type: File
    inputBinding:
      prefix: --INPUT
      position: 1
    secondaryFiles:
      - .idx
    doc: "Input vcf file for analysis  Required."
  dbsnp:
    type: File
    inputBinding:
      prefix: --DBSNP
      position: 2
    secondaryFiles:
      - .idx
    doc: "Reference dbSNP file in dbSNP or VCF format.  Required."
  sequence_dictionary:
    type: File?
    inputBinding:
      prefix: --SEQUENCE_DICTIONARY
      position: 3
    doc: "If present, speeds loading of dbSNP file, will look for dictionary in vcf if not present here."
  output_metrics_filename_prefix:
    type: string
    inputBinding:
      prefix: --OUTPUT
      position: 4
    doc: "Path (except for the file extension) of output metrics files to write."
  thread_count:
    type: int?
    inputBinding:
      prefix: --THREAD_COUNT
      position: 5
    doc: "Number of threads to use (Undocumented in gatk CLI help)"
  target_intervals:
    type: File?
    inputBinding:
      prefix: --TARGET_INTERVALS
      position: 6
    doc: "Target intervals to restrict analysis to."
    # This tool does not accept an interval padding argument
  java_opt:
    type: string
    doc: "String of options to pass to JVM at runtime"
    inputBinding:
      prefix: "--java-options"
      position: -1 # before the tool name
      shellQuote: true
outputs:
  output_detail_metrics:
    type: File
    outputBinding:
      glob: $(inputs.output_metrics_filename_prefix + '.variant_calling_detail_metrics')
  output_summary_metrics:
    type: File
    outputBinding:
      glob: $(inputs.output_metrics_filename_prefix + '.variant_calling_summary_metrics')
arguments:
- valueFrom: CollectVariantCallingMetrics
  position: 0
