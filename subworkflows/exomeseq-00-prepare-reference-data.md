## Phase 1: Prepare Reference Data

This should be run on a pair of target and bait files in bed format.

CWL: [exomeseq-00-prepare-reference-data.cwl](exomeseq-01-preprocessing.cwl)

### Inputs

- target\_intervals: `File[]?` - target intervals from the capture kit in bed format
- bait\_intervals: `File[]?` - bait or probes intervals from the capture kit in bed format
- reference\_genome: `File` reference genome, fasta

### Outputs

- target\_interval_list: `File` - target intervals in picard Interval\_list format
- bait\_interval\_list: `File` - bait intervals in picard Interval\_list format
