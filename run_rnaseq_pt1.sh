#!/bin/bash

mkdir -p data
cwltool --outdir ./data workflows/rnaseq-pt1.cwl samples/rnaseq-pt1.json
