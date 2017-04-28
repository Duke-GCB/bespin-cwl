#!/bin/bash

OUTDIR=data/variant_discovery_applyrecal
LOGDIR=log/variant_discovery_applyrecal

mkdir -p $OUTDIR
mkdir -p $LOGDIR
date
cwltool --debug --outdir ./${OUTDIR} workflows/exomeseq-02a-applyrecal.cwl samples/exomeseq-02a-applyrecal.json > >(tee $LOGDIR/exomeseq-out-$(date +"%Y%m%d-%k%M%S").log) 2> >(tee $LOGDIR/exomeseq-err-$(date +"%Y%m%d-%k%M%S").log >&2)
date
