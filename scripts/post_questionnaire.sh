#!/bin/bash

# Script to upload JSON to a bespin server, creating workflow,  workflow version,
# and questionnaire. See examples/*-bespin.json.
#
# Usage:
#
#   export BESPIN_API_TOKEN=admin-user-token
#   export BESPIN_API_HOST=https://bespin.example.org
#   ./post_questionnaire.sh questionnaire.json

[[ -z "$1" ]] && echo "Usage: $0 questionnaire.json" && exit 1
[[ -z "$BESPIN_API_TOKEN" ]] && echo "Error: Please set BESPIN_API_TOKEN to a valid token" && exit 1
[[ -z "$BESPIN_API_HOST" ]] && echo "Error: Please set BESPIN_API_HOST, e.g. https://bespin.genome.duke.edu" && exit 1

curl \
  -H "Authorization: Token ${BESPIN_API_TOKEN}" \
  -H "Content-Type: application/json" \
  -d @$1 \
  "${BESPIN_API_HOST}/api/admin/import-workflow-questionnaire/"
