#!/bin/bash

mkdir -p data
cwltool --outdir ./data tools/picard-MarkDuplicates.cwl samples/markduplicates.json
