#!/bin/bash

mkdir -p data
mkdir -p log
date
cwltool --debug --outdir ./data workflows/exomeseq-readgroups-and-recalibrate.cwl samples/exomeseq-readgroups-and-recalibrate.json > >(tee log/exomeseq-out-$(date +"%Y%m%d-%k%M%S").log) 2> >(tee log/exomeseq-err-$(date +"%Y%m%d-%k%M%S").log >&2)
date
