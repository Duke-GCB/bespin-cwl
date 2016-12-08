#!/bin/bash

mkdir -p data
date
cwltool --outdir ./data workflows/rnaseq-pt1.cwl samples/rnaseq-pt1.json
date
