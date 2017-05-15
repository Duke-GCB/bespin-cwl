# Exome-seq workflow

Based on https://software.broadinstitute.org/gatk/best-practices/bp_3step.php?case=GermShortWGS

Data Sets:

- Reference genome in uncompressed .fa format (GATK does not accept the compressed version) For human genome, we use broad b37 bundle. This is idnexed with bwa, and different steps require different secondaryFiles for its index.

Notes:

- Broad recommends raw illumina basecalls, converted to unmapped SAM. This has more metadata, but is larger and won't typically be available from sequencing facilities like FASTQ. May be possible in more integrated facilities or in the future, but it not available now.
- read groups must be supplied

Phases:

1. Preprocessing [exomeseq-01-preprocessing.md](exomeseq-01-preprocessing.md)
2. Variant Discovery [exomeseq-02-variantdiscovery.md](exomeseq-02-variantdiscovery.md)
3. Callset Refinement [exomeseq-03-callset-refinement.md](exomeseq-03-callset-refinement.md)

