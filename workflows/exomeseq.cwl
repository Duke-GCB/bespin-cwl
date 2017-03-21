#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  reads: File[]
  map_reference_genome: File
  map_threads: int?
outputs:
  mapped:
    type: File[]
    outputSource: map/output
steps:
  map:
    run: ../community-workflows/tools/bwa-mem.cwl
    in:
      reads: reads
      reference: map_reference_genome
      output_filename:
        default: "mapped.sam"
      threads: map_threads
    out:
      - output
