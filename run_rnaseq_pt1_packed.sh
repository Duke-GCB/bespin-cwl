#!/bin/bash

mkdir -p data
date
cwltool --outdir ./data packed-workflows/rnaseq-pt1-packed.cwl#main samples/rnaseq-pt1.json
date
