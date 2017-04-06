#!/bin/bash

set -ex

mkdir -p data
cwltool --outdir ./data community-workflows/tools/GATK-BaseRecalibrator.cwl samples/baserecalibrate-01-analyze-covariation.json
cwltool --outdir ./data community-workflows/tools/GATK-BaseRecalibrator.cwl samples/baserecalibrate-02-covariation-after-recalibration.json
cwltool --outdir ./data community-workflows/tools/GATK-AnalyzeCovariates.cwl samples/baserecalibrate-03-WRITE_ANALYZE_COVARIATES-generate-beforeafterplots.json
cwltool --outdir ./data community-workflows/tools/GATK-PrintReads.cwl samples/baserecalibrate-04-PRINTREADS-apply-recalibration.json

