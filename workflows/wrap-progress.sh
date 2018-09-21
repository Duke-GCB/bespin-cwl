#!/bin/bash

cwltool progress-demo.cwl progress-demo.json > result.json 2> stderr.log
echo "Result"
cat result.json
echo "Progress"
python extract-progress.py stderr.log
# rm result.json stderr.log
