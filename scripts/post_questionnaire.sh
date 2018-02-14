#!/bin/bash

curl \
  -v \
  -H "Authorization: Token ${LANDO_TOKEN}" \
  -H "Content-Type: application/json" \
  -X POST \
  -d @exomeseq-bespin.json \
  "${BESPIN_API_HOST}/api/admin/import-workflow-questionnaire/"
