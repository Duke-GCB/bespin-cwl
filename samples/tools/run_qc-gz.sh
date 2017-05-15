#!/bin/bash

mkdir -p data
cwltool --outdir ./data tools/fastqc.cwl samples/qc-gz.json
