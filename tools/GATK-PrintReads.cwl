#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- $import: envvar-global.yml
- class: DockerRequirement
  dockerPull: 'dukegcb/gatk-base:3'
hints:
- class: SoftwareRequirement
  packages:
      gatk:
          version: [ "3.8" ]
          s:citation: https://dx.doi.org/10.1038/ng.806

inputs: # position 0, for java args, 1 for the jar, 2 for the tool itself
  GATKJar:
    type: File
    inputBinding:
      position: 1
      prefix: -jar
  sample_file:
    type: File[]?
    inputBinding:
      position: 2

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
  platform:
    type: string?
    inputBinding:
      position: 2
      prefix: --platform
    doc: Exclude all reads with this platform from the output
  input_baseRecalibrator:
    type: File
    inputBinding:
      position: 2
      prefix: -BQSR
    doc: the recalibration table produced by BaseRecalibration
  number:
    type: string?
    inputBinding:
      position: 2
      prefix: --number
    doc: Exclude all reads with this platform from the output
  simplify:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --simplify
    doc: Erase all extra attributes in the read but keep the read group information
  readGroup:
    type: string?
    inputBinding:
      position: 2
      prefix: --readGroup
    doc: Exclude all reads with this read group from the output
  sample_name:
    type: string[]?
    inputBinding:
      position: 2
    doc: Sample name to be included in the analysis. Can be specified multiple times.
  inputBam_printReads:
    type: File
    inputBinding:
      position: 2
      prefix: -I
    secondaryFiles:
    - ^.bai
    doc: bam file produced after indelRealigner
  outputfile_printReads:
    type: string?
    inputBinding:
      position: 2
      prefix: -o
    doc: name of the output file from indelRealigner
  java_arg:
    type: string
    default: -Xmx4g
    inputBinding:
      position: 0
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
  interval_padding:
    type: int?
    inputBinding:
      position: 2
      prefix: --interval_padding
    doc: Amount of padding (in bp) to add to each interval
  cpu_threads:
    type: int?
    doc: controls the number of CPU threads allocated to each data thread
    default: 8 # Recommended by https://software.broadinstitute.org/gatk/documentation/article?id=1975
    inputBinding:
      position: 2
      prefix: -nct

outputs:
  output_printReads:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_printReads)
    secondaryFiles:
    - ^.bai


arguments:
- valueFrom: $(runtime.tmpdir)
  position: 0
  separate: false
  prefix: -Djava.io.tmpdir=
- valueFrom: PrintReads
  position: 2
  prefix: -T
baseCommand: [java]
doc: |
  GATK-RealignTargetCreator.cwl is developed for CWL consortium
  Prints all reads that have a mapping quality above zero
    Usage: java -Xmx4g -jar GenomeAnalysisTK.jar -T PrintReads -R reference.fasta -I input1.bam -I input2.bam -o output.bam --read_filter MappingQualityZero

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
