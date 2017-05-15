#!/bin/bash

mkdir -p data
cwltool --outdir ./data tools/picard-SortSam.cwl samples/sortsam.json
