#!/bin/bash

OUTDIR=data/variant_discovery_toil
LOGDIR=log/variant_discovery_toil

mkdir -p $OUTDIR
mkdir -p $LOGDIR
date
cwltoil --logDebug --outdir ./${OUTDIR} workflows/exomeseq-02-variantdiscovery.cwl samples/exomeseq-02-variantdiscovery.json > >(tee $LOGDIR/exomeseq-out-$(date +"%Y%m%d-%k%M%S").log) 2> >(tee $LOGDIR/exomeseq-err-$(date +"%Y%m%d-%k%M%S").log >&2)
date