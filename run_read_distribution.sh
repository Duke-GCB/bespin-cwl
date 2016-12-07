#!/bin/bash

mkdir -p data
cwltool --outdir ./data tools/read_distribution.cwl samples/read_distribution.json
