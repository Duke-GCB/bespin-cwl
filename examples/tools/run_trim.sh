#!/bin/bash

mkdir -p data
cwltool --outdir ./data tools/trim_galore.cwl samples/trim.json
