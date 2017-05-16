#!/bin/bash

set -ex

mkdir -p ../../data/print_reads 
cwltool --outdir ../../data/print_reads ../../community-workflows/tools/GATK-PrintReads.cwl print_reads.json

