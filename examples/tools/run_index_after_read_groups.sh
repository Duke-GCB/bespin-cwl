#!/bin/bash

mkdir -p data
cwltool --outdir ./data community-workflows/tools/samtools-index.cwl samples/index-readgroups.json
