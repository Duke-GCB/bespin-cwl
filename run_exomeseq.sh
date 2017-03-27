#!/bin/bash

mkdir -p data
date
cwltool --outdir ./data workflows/exomeseq.cwl samples/exomeseq.json | tee exomeseq-$(date +"%Y%m%d-%k%M%S").log
date
