#!/bin/bash

# usage: ./run.sh exomeseq-01-preprocessing
#   expects exomeseq-01-preprocessing.json and exomeseq-01-preprocessing.cwl

WORKFLOW_NAME="$1"

SCRIPT_DIR=$(dirname "$0")
ROOT_DIR=${SCRIPT_DIR}/../..
RUN_DATE=$(date +"%Y%m%d-%k%M%S")

WORKFLOWS_DIR=${ROOT_DIR}/workflows
DATA_ROOT=${ROOT_DIR}/data
LOG_ROOT=${ROOT_DIR}/log

JOB_NAME="${WORKFLOW_NAME}-${RUN_DATE}"
echo $JOB_NAME

OUT_DIR=${DATA_ROOT}/${JOB_NAME}/
LOG_DIR=${LOG_ROOT}/${JOB_NAME}/
TMP_DIR=${DATA_ROOT}/tmp/tmp

mkdir -p $OUT_DIR
mkdir -p $LOG_DIR
echo "Starting on $(date)..." > (tee ${LOG_DIR}/${WORKFLOW_NAME}-err.log)
cwltool \
  --debug \
  --outdir ${OUT_DIR} \
  --tmpdir-prefix ${TMP_DIR} \
  --tmp-outdir-prefix ${TMP_DIR} \
  ${WORKFLOWS_DIR}/${WORKFLOW_NAME}.cwl \
  ${WORKFLOW_NAME}.json \
  > >(tee ${LOG_DIR}/${WORKFLOW_NAME}-out.log) \
  2> >(tee ${LOG_DIR}/${WORKFLOW_NAME}-err.log >&2)
echo "Finished on $(date)..." > (tee ${LOG_DIR}/${WORKFLOW_NAME}-err.log)
