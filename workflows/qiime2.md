# QIIME2 mulit-part workflows

- __Step1__: Import Demux: `workflows/qiime2-step1-import-demux.cwl`
- __Step2-v1__: DADA2 Option: `workflows/qiime2-step2-dada2.cwl`
- __Step2-v2__: Deblur Option: `workflows/qiime2-step2-deblur.cwl`
- __Step3__: Alpha analysis: `workflows/qiime2-step3-alpha-analysis.cwl`


# Relation to QIIME2 Moving Pictures Tutorial

### Step1
 - [Obtaining and importing data](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#obtaining-and-importing-data)
 - [Demultiplexing sequences](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#demultiplexing-sequences)

### Step2-v1
Before running this step a user must determine `dada2_trim_left` and `dada2_trunc_len` parameters.
This can be done based on plots you see in `demux.qzv` created in __Step1__.

- [Option 1: DADA2](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#option-1-dada2)
- [FeatureTable and FeatureData summaries](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#featuretable-and-featuredata-summaries)
- [Generate a tree for phylogenetic diversity analyses](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#generate-a-tree-for-phylogenetic-diversity-analyses)
- [Taxonomic analysis](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#taxonomic-analysis)
- [Differential abundance testing with ANCOM](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#differential-abundance-testing-with-ancom)

### Step2-v2
Before running this step a user must determine `deblur_trim_length` parameters.
This can be done based on plots you see in `demux.qzv` created in __Step1__.
- [Option 2: Deblur](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#option-2-deblur)
- [FeatureTable and FeatureData summaries](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#featuretable-and-featuredata-summaries)
- [Generate a tree for phylogenetic diversity analyses](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#generate-a-tree-for-phylogenetic-diversity-analyses)
- [Taxonomic analysis](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#taxonomic-analysis)
- [Differential abundance testing with ANCOM](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#differential-abundance-testing-with-ancom)

### Step3
Before running this step a user must determine `diversity_sampling_depth` and `rarefaction_max_depth` parameters.
`diversity_sampling_depth` can be determined by looking at `table.qzv` from __Step2___.
`rarefaction_max_depth` can be determined by looking at `table.qzv` (Frequency per sample).

- [Alpha and beta diversity analysis](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#alpha-and-beta-diversity-analysis)
- [Alpha rarefaction plotting](https://docs.qiime2.org/2018.4/tutorials/moving-pictures/#alpha-rarefaction-plotting)

Each sub-step above corresponds to a cwl sub-workflow in the  `subworkflows/` directory with the qiime2 prefix.
Each command within these sub-workflows corresponds to a CWL CommandLineTool in `tools/qime2/` directory.
