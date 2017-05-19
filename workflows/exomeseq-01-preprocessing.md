## Phase 1: Preprocessing

This should be run on each pair of reads (samples)

CWL: [exomeseq-01-preprocessing.cwl](exomeseq-01-preprocessing.cwl)

Questions:

- will all reads be paired?
- How to derive read_group info from file name conventions
- Does picard do multithreading?
- Which files should be kept?

Tasks:

- Document file storage questions
- Write toil version of script

### Storage Requirements

With a sample paired-end 15G, exome-targeted read from 1000 genomes:

```
-rw-r--r-- 1 ubuntu ubuntu 7.5G Jun 23  2015 SRR099967_1.fastq.gz
-rw-r--r-- 1 ubuntu ubuntu 7.6G Jun 23  2015 SRR099967_2.fastq.gz
```

Reference Genome 8.9G (common):

```
-rw-r--r-- 1 ubuntu ubuntu  12K Mar 24 15:56 human_g1k_v37.dict
-rw-r--r-- 1 ubuntu ubuntu 2.6K Mar 24 15:56 human_g1k_v37.dict.gz
-rw-r--r-- 1 ubuntu ubuntu 3.0G Mar 24 15:59 human_g1k_v37.fasta
-rw-rw-r-- 1 ubuntu ubuntu 6.5K Mar 24 18:07 human_g1k_v37.fasta.amb
-rw-rw-r-- 1 ubuntu ubuntu 6.7K Mar 24 18:07 human_g1k_v37.fasta.ann
-rw-rw-r-- 1 ubuntu ubuntu 2.9G Mar 24 18:06 human_g1k_v37.fasta.bwt
-rw-r--r-- 1 ubuntu ubuntu 2.7K Mar 24 15:56 human_g1k_v37.fasta.fai
-rw-r--r-- 1 ubuntu ubuntu 1.1K Mar 24 15:56 human_g1k_v37.fasta.fai.gz
-rw-r--r-- 1 ubuntu ubuntu 830M Mar 24 15:59 human_g1k_v37.fasta.gz
-rw-rw-r-- 1 ubuntu ubuntu 740M Mar 24 18:07 human_g1k_v37.fasta.pac
-rw-rw-r-- 1 ubuntu ubuntu 1.5G Mar 24 18:28 human_g1k_v37.fasta.sa
```

Produces 97G:

```
-rw-rw-r-- 1 ubuntu ubuntu  44G May 17 17:56 mapped.bam
-rw-r--r-- 1 ubuntu root    14G May 17 19:50 marked_duplicates.bam
-rw-r--r-- 1 ubuntu root   2.7K May 17 19:50 marked_dup_metrics.txt
-rw-r--r-- 1 ubuntu root   854K May 17 20:36 post_recal_data.table
-rw-r--r-- 1 ubuntu root   663K May 17 20:31 recal_data.table
-rw-r--r-- 1 ubuntu root   148K May 17 20:36 recalibration_plots.pdf
-rw-r--r-- 1 ubuntu root   170K May 17 20:41 recal_reads.bai
-rw-r--r-- 1 ubuntu root   490M May 17 20:41 recal_reads.bam
-rw-r--r-- 1 ubuntu root    13G May 17 18:56 sorted.bam
-rw-r--r-- 1 ubuntu root   418K May 17 14:39 SRR099967_1_fastqc.zip
-rw-r--r-- 1 ubuntu root   3.4K May 17 15:17 SRR099967_1.fastq.gz_trimming_report.txt
-rw-r--r-- 1 ubuntu root   6.3G May 17 16:15 SRR099967_1_val_1.fq.gz
-rw-r--r-- 1 ubuntu root   405K May 17 14:50 SRR099967_2_fastqc.zip
-rw-r--r-- 1 ubuntu root   3.6K May 17 16:16 SRR099967_2.fastq.gz_trimming_report.txt
-rw-r--r-- 1 ubuntu root   6.4G May 17 16:15 SRR099967_2_val_2.fq.gz
-rw-r--r-- 1 ubuntu root   7.9M May 17 20:28 with_read_groups.bai
-rw-r--r-- 1 ubuntu root    14G May 17 20:28 with_read_groups.bam
```

During testing, the `intervals` was set to `20`, which filters the reads in the resultant `recal_reads.bam` to chr20, but not before. So the 44G `mapped.bam` and 13-14G `marked_duplicates.bam`, `sorted.bam`, and `with_read_groups.bam` are whole-exome.

### Inputs

- intervals: `string[]?` - genomic interval over which to operate. optional.
- reads: `File[]` - pair of fastq reads
- reference\_genome: `File` (with secondaryFiles of the bwa index.) Using bwa 0.7.x, 64 bit indexes are default and we do NOT use the `.64` file suffix.
- threads: `int?`
- read\_group\_{library,sample\_name,platform,platform\_unit}: read group information. likely derived from file name
- GATKJar: `File` - the GATK Jar file (must be supplied at runtime)

### Outputs

- QC Reports: `File[]` - pair of zipped QC reports from fastqc
- trimmed\_reads: `File[]` - pair of trimmed reads
- trim\_reports: `File[]` - pair of reports from trimming
- mapped: `File` - BAM file of reads mapped to reference genome (unnecessary?)
- mapped\_sorted: `File` - BAM file of reads mapped to reference genome, sorted by coordinate
- duplicate\_metrics: `File`: Table of metrics from picard's duplication marking
- deduplicated: `File`: BAM file of reads mapped, with duplicates marked by picard MarkDuplicates
- with\_read\_groups: `File`: BAM file of reads mapped, with duplicates marked by picard MarkDuplicates and read\_groups annotated
- recalibration\_before: `File`: Analysis before recalibration
- recalibration\_plots: `File`: Plots produced by recalibration comparison **This output is a single PDF file containing multple plots**
- recalibrated\_reads: `File`: BAM file of recalibrated reads, ultimate product of this workflow.

### Steps

Computational requirements noted below. Tested on `m1.xlarge` instance (8CPU, 16GB RAM). GATK tools offer a threads argument but it mostly has to be disabled. Picard tools used here do not support multiple threads.

Total run time was **6h13m**

- Runs fastqc on input reads
  - For each read: 8CPU, 2GB, 0h10m
- Runs trim_galore on input reads
  - 2 CPU, ? GB, 1h30m
- maps trimmed reads to reference genome (produces BAM file)
  - 8 CPU, 16GB, 1h40m (will scale beyond 8 CPU)
- sorts mapped BAM by genomic coordinate
  - 1 CPU, ? GB, 1h00m
- marks duplicate mapped reads
  - 1 CPU, ? GB, 0h54m
- adds read groups to deduplicated BAM
  - 1 CPU, ? GB, 0h38m
- Recalibrates the scores using GATK 4 step process
  - 1 CPU, ? GB, 0h13m (limited to chr20)
