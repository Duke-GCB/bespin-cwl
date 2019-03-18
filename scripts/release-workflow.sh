#!/usr/bin/env bash
set -e
WORKFLOW=$1

if [ ! -f $WORKFLOW ]
then
  echo "Error: No such workflow_file $WORKFLOW"
  exit 2
fi
WORKFLOW_BASE=$(basename $WORKFLOW)
WORKFLOW_NAME=$(echo $WORKFLOW_BASE | sed -e s'/.cwl//')

# make sure we are on master branch
git checkout master

# make sure the master branch is up to date
git pull

# determine what the next version will be
VERSION=$(git tag | grep ${WORKFLOW_NAME}-v | sed -e "s/${WORKFLOW_NAME}-v//" | sort -n | tail -n 1)
if [ -z "$VERSION" ]
then
   VERSION=0
fi
NEW_VERSION=$(($VERSION+1))

echo "Tagging branch with tag ${WORKFLOW_NAME}-v${NEW_VERSION}"
git tag -a ${WORKFLOW_NAME}-v${NEW_VERSION} -m "${WORKFLOW_NAME} ${NEW_VERSION}"

echo "Pushing tag to github to trigger build process for this workflow."
git push --tags


echo "Workflow tag pushed to github."
echo "Once build process completes this workflow can be added to bespin-api by running:"
echo "bespin workflow-version create --workflow ${WORKFLOW_NAME} \\"
echo "  --url  https://github.com/Duke-GCB/bespin-cwl/releases/download/${WORKFLOW_NAME}-v${NEW_VERSION}/${WORKFLOW_NAME}.cwl \\ "
echo "  --description ${WORKFLOW_NAME}-v${NEW_VERSION} \\ "
echo "  --version 3 "
