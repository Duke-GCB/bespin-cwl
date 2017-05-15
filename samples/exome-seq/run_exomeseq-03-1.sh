#!/bin/bash

OUTDIR=data/callset_refinement_01
LOGDIR=log/callset_refinement_01

mkdir -p $OUTDIR
mkdir -p $LOGDIR
date
cwltool --debug --outdir ./${OUTDIR} workflows/exomeseq-03-callset-refinement-01-refine-genotypes.cwl samples/exomeseq-03-01.json > >(tee $LOGDIR/exomeseq-out-$(date +"%Y%m%d-%k%M%S").log) 2> >(tee $LOGDIR/exomeseq-err-$(date +"%Y%m%d-%k%M%S").log >&2)
date
