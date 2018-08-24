#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
- $import: envvar-global.yml
- class: DockerRequirement
  dockerPull: 'dukegcb/gatk-base:3'
- class: SoftwareRequirement
  packages:
      gatk:
          version: [ "3.8" ]
          s:citation: https://dx.doi.org/10.1038/ng.806

inputs: # position 0, for java args, 1 for the jar, 2 for the tool itself
  java_arg:
    type: string
    default: -Xmx4g
    inputBinding:
      position: 0
  GATKJar:
    type: File
    inputBinding:
      position: 1
      prefix: -jar
  # Required inputs
  variants:
    type:
      type: array
      items: File
      inputBinding:
        prefix: -V
    inputBinding:
      position: 2
    doc: One or more input gVCF files
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
    doc: Reference genome assembly, indexed
  # Optional inputs
  dbsnp:
    type: File?
    inputBinding:
      position: 2
      prefix: --dbsnp
    doc: latest_dbsnp.vcf set of known indels
  # Optional Parameters
  group:
    type: string[]?
    inputBinding:
      position: 2
      prefix: --group
    doc: One or more classes/groups of annotations to apply to variant calls
  heterozygosity:
    type: double?
    inputBinding:
      position: 2
      prefix: --heterozygosity
    doc: Heterozygosity for indel calling
  heterozygosity_stdev:
    type: double?
    inputBinding:
      position: 2
      prefix: --heterozygosity_stdev
    doc: Heterozygosity for indel calling
  indel_heterozygosity:
    type: double?
    inputBinding:
      position: 2
      prefix: --indel_heterozygosity
    doc: Heterozygosity for indel calling
  sample_ploidy:
    type: int?
    inputBinding:
      position: 2
      prefix: --sample_ploidy
    doc: Use additional trigger on variants found in an external alleles file
  stand_call_conf:
    type: double?
    inputBinding:
      position: 2
      prefix: --standard_min_confidence_threshold_for_calling
    doc: The minimum phred-scaled confidence threshold at which variants should be
      called
  # Optional Flags
  annotateNDA:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --annotateNDA
    doc: If provided, we will annotate records with the number of alternate alleles
      that were discovered (but not necessarily genotyped) at a given site
  includeNonVariantSites:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --includeNonVariantSites
    doc: Include loci found to be non-variant after genotyping
  useNewAFCalculator:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --useNewAFCalculator
    doc: Use new AF model instead of the so-called exact model
  # Advanced Parameters
  annotation:
    type: string[]?
    inputBinding:
      position: 2
      prefix: --annotation
    doc: One or more specific annotations to apply to variant calls
  input_prior:
    type: double[]?
    inputBinding:
      position: 2
      prefix: --input_prior
    doc: Input prior for calls
  max_alternate_alleles:
    type: int?
    inputBinding:
      position: 2
      prefix: --max_alternate_alleles
    doc: Maximum number of alternate alleles to genotype
  max_genotype_count:
    type: int?
    inputBinding:
      position: 2
      prefix: --max_genotype_count
    doc: Maximum number of genotypes to consider at any site
  max_num_PL_values:
    type: int?
    inputBinding:
      position: 2
      prefix: --max_num_PL_values
    doc: Maximum number of PL values to output
  # Output file
  outputfile_GenotypeGVCFs:
    type: string?
    inputBinding:
      position: 2
      prefix: -o
    doc: name of the output file from GenotypeGVCFs
  # GATK Common
  intervals:
    type: File[]?
    inputBinding:
      position: 2
      prefix: --intervals
    doc: One or more genomic intervals over which to operate
  interval_padding:
    type: int?
    inputBinding:
      position: 2
      prefix: --interval_padding
    doc: Amount of padding (in bp) to add to each interval
  threads:
    type: int?
    inputBinding:
      position: 2
      prefix: -nt
    doc: Number of data threads to allocate to this analysis
outputs:
  output_GenotypeGVCFs:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_GenotypeGVCFs)
    secondaryFiles:
      - .idx

arguments:
- valueFrom: $(runtime.tmpdir)
  position: 0
  separate: false
  prefix: -Djava.io.tmpdir=
- valueFrom: GenotypeGVCFs
  position: 2
  prefix: -T
baseCommand: [java]
doc: |
  GATK-GenotypeGVCFs.cwl is developed for CWL consortium
  Perform joint genotyping on gVCF files produced by HaplotypeCaller

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
