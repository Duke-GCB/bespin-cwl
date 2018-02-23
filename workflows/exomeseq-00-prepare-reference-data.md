## Phase 1: Prepare Reference Data

This should be run on a pair of target and bait files in bed format.

CWL: [exomeseq-00-prepare-reference-data.cwl](exomeseq-01-preprocessing.cwl)

### Inputs

- intervals: `File[]?` - target intervals from the capture kit in bed format
- primary_intervals: `File[]?` - bait intervals from the capture kit in bed format
- reference\_genome: `File` reference genome, fasta

### Outputs

- target_interval_list: `File` - target intervals in picard Interval_list format
- bait_interval_list: `File` - bait intervals in picard Interval_list format
