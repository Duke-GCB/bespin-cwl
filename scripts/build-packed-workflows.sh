#!/bin/bash

# Clear out any existing builds
rm -rf build
mkdir build

for WORKFLOW in workflows/*.cwl; do
  BASE=$(basename $WORKFLOW)
  cwltool --pack $WORKFLOW > build/${BASE}
done
