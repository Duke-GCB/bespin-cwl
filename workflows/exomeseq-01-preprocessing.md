## Phase 1: Preprocessing

This should be run on each pair of reads (samples)

CWL: [exomeseq-01-preprocessing.cwl](exomeseq-01-preprocessing.cwl)

Questions:

- will all reads be paired?
- How to derive read_group info from file name conventions
- Does picard do multithreading?
- Which files should be kept?

Tasks:

- Ensure preprocessing guarantees an indexed BAM file
- Update example JSON - current json is piecemeal and needs to be condensed.

Inputs:

- intervals: `string[]?` - genomic interval over which to operate. optional.
- reads: `File[]` - pair of fastq reads
- reference\_genome: `File` (with secondaryFiles of the bwa index.) Using bwa 0.7.x, 64 bit indexes are default and we do NOT use the `.64` file suffix.
- threads: `int?`
- read\_group\_{library,sample\_name,platform,platform\_unit}: read group information. likely derived from file name
- GATKJar: `File` - the GATK Jar file (must be supplied at runtime)

Outputs:

- QC Reports: `File[]` - pair of zipped QC reports from fastqc
- trimmed\_reads: `File[]` - pair of trimmed reads
- trim\_reports: `File[]` - pair of reports from trimming
- mapped: `File` - BAM file of reads mapped to reference genome (unnecessary?)
- mapped\_sorted: `File` - BAM file of reads mapped to reference genome, sorted by coordinate
- duplicate\_metrics: `File`: Table of metrics from picard's duplication marking
- deduplicated: `File`: BAM file of reads mapped, with duplicates marked by picard MarkDuplicates
- with\_read\_groups: `File`: BAM file of reads mapped, with duplicates marked by picard MarkDuplicates and read\_groups annotated
- recalibration\_before: `File`: Analysis before recalibration
- recalibration\_plots: `File`: Plots produced by recalibration comparison **Single file?**
- recalibrated\_reads: `File`: BAM file of recalibrated reads, ultimate product of this workflow. **NEEDS INDEX**

Steps:

- Runs fastqc on input reads
- Runs trim_galore on input reads
- maps trimmed reads to reference genome (produces BAM file)
- sorts mapped BAM by genomic coordinate
- marks duplicate mapped reads
- adds read groups to deduplicated BAM
- Recalibrates the scores using GATK 4 step process
