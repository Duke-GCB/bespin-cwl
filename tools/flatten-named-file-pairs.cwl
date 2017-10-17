#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Extracts
requirements:
  - class: InlineJavascriptRequirement
  - $import: ../types/bespin-types.yml
inputs:
  # Named read pairs in FASTQ format
  read_pairs:
      type: ../types/bespin-types.yml#NamedFilePairType[]
outputs:
  reads:
    type: { type: array, items: { type: array, items: File }}
  sample_names: string[]

expression: >
  ${
    var read_pairs = inputs.read_pairs
    var reads = [];
    var sample_names = [];
    for (var i=0;i<read_pairs.length;i++) {
      var samples_files = [];
      //for each read add the file and sample name to output arrays
      sample_names.push(read_pairs[i].name);
      samples_files.push(read_pairs[i].file1);

      sample_names.push(read_pairs[i].name);
      samples_files.push(read_pairs[i].file2);
      reads.push(samples_files);
    }
    return {
      reads: reads,
      sample_names: sample_names
    };
  }
