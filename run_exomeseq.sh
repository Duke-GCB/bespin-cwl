#!/bin/bash

mkdir -p data
date
cwltool --outdir ./data workflows/exomeseq.cwl samples/exomeseq.json
date
