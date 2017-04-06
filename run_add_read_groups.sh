#!/bin/bash

set -ex

mkdir -p data
cwltool --outdir ./data tools/picard-AddOrReplaceReadGroups.cwl samples/add-read-groups.json

