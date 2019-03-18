# bespin-cwl
CWL workflows for Bespin

## Releasing New Workflow Versions

CWL workflows are published via github releases. These workflows are packed and uploaded by a CircleCI process.
The release tag name is based on the workflow filename(without .cwl extension) and a version number.
After making changes and committing them to the master branch the workflow must be tagged appropriately and pushed to master.
There is a script to determine the next available version number, tag the workflow, push the tag to Github triggering the CircleCI process.
```
./scripts/release-workflow.sh <workflow_path>
```
So for example to release a new version of [workflows/exomeseq.cwl](https://github.com/Duke-GCB/bespin-cwl/blob/master/workflows/exomeseq.cwl) from the root directory of this repository
run:
```
./scripts/release-workflow.sh workflows/exomeseq.cwl
```


