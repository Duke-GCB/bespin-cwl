#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- $import: envvar-global.yml
- class: DockerRequirement
  dockerPull: 'dukegcb/gatk-base:3'

inputs: # position 0, for java args, 1 for the jar, 2 for the tool itself
  GATKJar:
    type: File
    inputBinding:
      position: 1
      prefix: -jar
  reference:
    type: File
    inputBinding:
      position: 2
      prefix: -R
    secondaryFiles:
    - .amb
    - .ann
    - .bwt
    - .pac
    - .sa
    - .fai
    - ^.dict
  java_arg:
    type: string
    default: -Xmx4g
    inputBinding:
      position: 0
  inputTable_before:
    type: File
    inputBinding:
      position: 2
      prefix: -before
    doc: Data table before recalibration
  inputTable_after:
    type: File
    inputBinding:
      position: 2
      prefix: -after
    doc: Data table after recalibration
  outputfile_recalibrationPlots:
    type: string
    inputBinding:
      position: 2
      prefix: -plots
    doc: name of the output plots file from analyzeCovariates
  lowMemoryMode:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --lowMemoryMode
    doc: Reduce memory usage in multi-threaded code at the expense of threading efficiency

  intervals:
    type:
    - 'null'
    - type: array
      items: File
      inputBinding:
        prefix: --intervals
    inputBinding:
      position: 2
    doc: One or more genomic intervals over which to operate
  before:
    type: File?
    inputBinding:
      position: 2
      prefix: --before
    doc: Input covariates table file for on-the-fly base quality score recalibration

outputs:
  output_recalibrationPlots:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_recalibrationPlots)

arguments:
- valueFrom: $(runtime.tmpdir)
  position: 0
  separate: false
  prefix: -Djava.io.tmpdir=
- valueFrom: AnalyzeCovariates
  position: 2
  prefix: -T
baseCommand: [java]
doc: |
  GATK-AnalyzeCovariates.cwl is developed for CWL consortium
  It generates a document called recalibration_plots.pdf containing plots that show how the reported base qualities match up to the
  empirical qualities calculated by the BaseRecalibrator.
    Usage: java -jar GenomeAnalysisTK.jar -T AnalyzeCovariates -R reference.fa -before recal_data.table -after post_recal_data.table \
      -plots recalibration_plots.pdf


