#!/bin/bash

# usage: ./run.sh exomeseq-01-preprocessing
#   expects exomeseq-01-preprocessing.json and exomeseq-01-preprocessing.cwl

WORKFLOW_NAME="$1"

SCRIPT_DIR=$(dirname "$0")
ROOT_DIR=$(readlink -f "${SCRIPT_DIR}/../..")
RUN_DATE=$(date +"%Y%m%d-%k%M%S")

WORKFLOWS_DIR=${ROOT_DIR}/workflows
DATA_ROOT=${ROOT_DIR}/data
LOG_ROOT=${ROOT_DIR}/log

JOB_NAME="${WORKFLOW_NAME}-${RUN_DATE}"
echo $JOB_NAME

OUT_DIR=${DATA_ROOT}/${WORKFLOW_NAME}/
CACHE_DIR=${DATA_ROOT}/${WORKFLOW_NAME}-cache
LOG_DIR=${LOG_ROOT}/${JOB_NAME}/

mkdir -p $OUT_DIR
mkdir -p $LOG_DIR
mkdir -p $CACHE_DIR
echo "Starting on $(date)..." >(tee ${LOG_DIR}/${JOB_NAME}-err.log)
cwltool \
  --debug \
  --cachedir ${CACHE_DIR} \
  --outdir ${OUT_DIR} \
  ${WORKFLOWS_DIR}/${WORKFLOW_NAME}.cwl \
  ${WORKFLOW_NAME}.json \
  > >(tee ${LOG_DIR}/${JOB_NAME}-out.log) \
  2> >(tee -a ${LOG_DIR}/${JOB_NAME}-err.log >&2)
echo "Finished on $(date)..." >(tee -a ${LOG_DIR}/${JOB_NAME}-err.log)
