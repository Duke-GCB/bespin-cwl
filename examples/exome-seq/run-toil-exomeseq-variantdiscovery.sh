#!/bin/bash

OUTDIR=$(pwd)/data/variant_discovery_toil
LOGDIR=$(pwd)/log/variant_discovery_toil

mkdir -p $OUTDIR
mkdir -p $LOGDIR
date
. /home/ubuntu/toil/bin/activate
cwltoil --logDebug --realTimeLogging --outdir ${OUTDIR} workflows/exomeseq-02-variantdiscovery.cwl samples/exomeseq-02-variantdiscovery.json > >(tee $LOGDIR/exomeseq-out-$(date +"%Y%m%d-%k%M%S").log) 2> >(tee $LOGDIR/exomeseq-err-$(date +"%Y%m%d-%k%M%S").log >&2)
date
