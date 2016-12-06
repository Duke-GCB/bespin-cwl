#!/bin/bash

mkdir -p data
cwltool --outdir ./data community-workflows/tools/STAR.cwl samples/star.json
