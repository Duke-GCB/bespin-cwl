#!/bin/bash

set -e

# Clear out any existing builds
OUTDIR="build"

rm -rf ${OUTDIR}
mkdir ${OUTDIR}

for WORKFLOW in workflows/*.cwl; do
  BASE=$(basename $WORKFLOW)
  cwltool --pack $WORKFLOW > ${OUTDIR}/${BASE}
done
