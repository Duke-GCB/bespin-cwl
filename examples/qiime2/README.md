# Instructions for running on Duke HARDAC cluster

## Setup
- [Install cwltool](https://github.com/common-workflow-language/cwltool#install)
- [Install qiime2](https://docs.qiime2.org/2018.4/install/native/)


## Create Input File for Step 1
Create a file named `qiime_step1.yml` with contents simlar to:
```
sequences:
  class: File
  location: TODO/sequences.fastq.gz
barcodes:
  class: File
  location: TODO/barcodes.fastq.gz
sample_metadata:
  class: File
  location: TODO/sample-metadata.tsv
metadata_barcodes_column: BarcodeSequence
```
Replace `TODO/<filename>` with your actual filenames.

## Run workflow for Step 1
On an interactive node setup your environment so the `qiime` and `cwltool` commands can be run.

Then run the following commands:
```
export MPLBACKEND="agg"
QIIME_STEP1_WORKFLOW=https://raw.githubusercontent.com/Duke-GCB/bespin-cwl/qiime2-workflow/packed/qiime2-step1-import-demux.cwl
cwltool --preserve-environment LANG --preserve-environment MPLBACKEND --no-container $QIIME_STEP1_WORKFLOW qiime_step1.yml
```

There will be many lines of output from cwltool.
A successful run should end with:
```
Final process status is success
```

At this point the output files should be in your current directory:
- `emp-single-end-sequences.qza`
- `demux.qza`
- `demux.qzv`
