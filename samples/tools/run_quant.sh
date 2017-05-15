#!/bin/bash

mkdir -p data
cwltool --outdir ./data tools/htseq-count.cwl samples/quant.json
