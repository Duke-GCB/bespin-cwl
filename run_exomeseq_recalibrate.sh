#!/bin/bash

mkdir -p data/recalibrate
mkdir -p log/recalibrate
date
cwltool --debug --outdir ./data/recalibrate workflows/exomeseq-recalibrate.cwl samples/exomeseq-recalibrate.json > >(tee log/recalibrate/exomeseq-out-$(date +"%Y%m%d-%k%M%S").log) 2> >(tee log/recalibrate/exomeseq-err-$(date +"%Y%m%d-%k%M%S").log >&2)
date
