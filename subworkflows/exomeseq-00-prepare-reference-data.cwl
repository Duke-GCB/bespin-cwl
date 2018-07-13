#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  # Intervals should come from capture kit (target intervals) bed format
  target_intervals: File[]?
  # Intervals should come from capture kit (bait intervals) bed format
  bait_intervals: File[]?
  reference_genome:
    type: File
    secondaryFiles:
    - .amb
    - .ann
    - .bwt
    - .pac
    - .sa
    - .fai
    - ^.dict
outputs:
  target_interval_list:
    type: File
    outputSource: make_target_interval_list/output_interval_list_file
  bait_interval_list:
    type: File
    outputSource: make_bait_interval_list/output_interval_list_file
steps:
  make_target_interval_list:
    run: ../tools/picard-BedToIntervalList.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 4000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      input_file: target_intervals
      reference_sequence: reference_genome
    out:
      - output_interval_list_file
  make_bait_interval_list:
    run: ../tools/picard-BedToIntervalList.cwl
    requirements:
      - class: ResourceRequirement
        coresMin: 1
        ramMin: 4000
        outdirMin: 12000
        tmpdirMin: 12000
    in:
      input_file: bait_intervals
      reference_sequence: reference_genome
    out:
      - output_interval_list_file
