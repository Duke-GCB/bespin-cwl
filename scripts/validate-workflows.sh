#!/bin/bash

set -e

for WORKFLOW in workflows/*.cwl; do
  cwltool --validate $WORKFLOW
done
