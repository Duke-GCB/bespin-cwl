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
echo $NEW_VERSION

# add the new tag and push to github
git tag -a ${WORKFLOW_NAME}-v${NEW_VERSION} -m "${WORKFLOW_NAME} ${NEW_VERSION}"
git push --tags
