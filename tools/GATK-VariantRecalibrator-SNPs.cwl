#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool


doc: |
  GATK-VariantsRecalibrator.cwl is developed for CWL consortium

  Usage:
  ```
  java -Xmx8G \
        -jar gatk.jar
        -T VariantRecalibrator \
        -R [reference_fasta] \
        -recalFile    $tmpDir/out.recal \
        -tranchesFile $tmpDir/out.tranches \
        -rscriptFile  $tmpDir/out.R \
        -nt 4 \
        -an MQRankSum -an ReadPosRankSum -an DP -an FS -an QD \
        -mode SNP \
        -resource:hapmap,known=false,training=true,truth=true,prior=15.0 [hapmap_vcf] \
        -resource:dbsnp,known=true,training=false,truth=false,prior=2.0  [dbsnp_vcf] \
        -resource:omni,known=false,training=true,truth=true,prior=12.0   [1komni_vcf] \
        -resource:1000G,known=false,training=true,truth=false,prior=10.0 [1ksnp_vcf]
  ```


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

  variants:
    type: File
    secondaryFiles:
    - .idx
    inputBinding:
      position: 2
      prefix: -input
    doc: input vcf File raw variant calls from haplotype caller

  threads:
    type: int?
    inputBinding:
      position: 2
      prefix: -nt
    doc: Number of data threads to allocate to this analysis

  reference:
    type: File
    secondaryFiles:
    - .fai
    - ^.dict
    inputBinding:
      position: 2
      prefix: -R
    doc: reference genome

  resource_hapmap:
    type: File
    secondaryFiles:
    - .idx
    inputBinding:
      position: 2
      prefix: -resource:hapmap,known=false,training=true,truth=true,prior=15.0
    doc: hapmap reference data

  resource_omni:
    type: File
    secondaryFiles:
    - .idx
    inputBinding:
      position: 2
      prefix: -resource:omni,known=false,training=true,truth=false,prior=12.0
    doc: omni reference data

  resource_1kg:
    type: File
    secondaryFiles:
    - .idx
    inputBinding:
      position: 2
      prefix: -resource:1000G,known=false,training=true,truth=false,prior=10.0
    doc: 1000 genome reference data

  resource_dbsnp:
    type: File
    secondaryFiles:
    - .idx
    inputBinding:
      position: 2
      prefix: -resource:dbsnp,known=true,training=false,truth=false,prior=2.0
    doc: dbSNP reference data

  annotations:
    type:
      type: array
      items: string
      inputBinding:
        prefix: -an
    inputBinding:
      position: 2
    doc: The names of the annotations which should used for calculations

  outputfile_tranches:
    type: string
    inputBinding:
      position: 2
      prefix: -tranchesFile

  outputfile_recal:
    type: string
    inputBinding:
      position: 2
      prefix: -recalFile

  outputfile_rscript:
    type: string?
    inputBinding:
      position: 2
      prefix: -rscriptFile

  intervals:
    type: File[]?
    inputBinding:
      position: 2
      prefix: --intervals
    doc: One or more genomic intervals over which to operate

  max_gaussians:
    type: int?
    inputBinding:
      position: 2
      prefix: --maxGaussians
    doc: Maximum number of different clusters (gaussians) of variants the program is allowed to try to identify.

  java_arg:
    type: string
    default: -Xmx8g
    inputBinding:
      position: 0

outputs:
  tranches_File:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_tranches)
    secondaryFiles:
      - .pdf
    doc: the tranches File

  recal_File:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_recal)
    secondaryFiles:
      - .pdf
    doc: the recal File

  vqsr_rscript:
    type: File?
    outputBinding:
      glob: $(inputs.outputfile_rscript)
    secondaryFiles:
      - .pdf
    doc: The output recalibration R script for the plots

arguments:
- valueFrom: $(runtime.tmpdir)
  position: 0
  separate: false
  prefix: -Djava.io.tmpdir=
- valueFrom: VariantRecalibrator
  position: 2
  prefix: -T
- valueFrom: SNP
  position: 2
  prefix: -mode

baseCommand: [java]

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
