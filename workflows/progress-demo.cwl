cwlVersion: v1.0
class: Workflow
label: Progress Reporting Demo
requirements:
  - class: StepInputExpressionRequirement
  - class: ScatterFeatureRequirement
inputs:
  files: File[]
outputs:
  output_file:
    type: File[]
    outputSource: wordcount/output
steps:
  cat:
    scatter: file
    run: ../tools/cat.cwl
    in:
      file: files
    out:
      - output
  progress1:
    run: ../tools/report-progress.cwl
    scatter: file
    in:
      step_name: { valueFrom: "cat" }
      step_status: { valueFrom: "complete" }
      file: cat/output
    out: []
  wordcount:
    run: ../tools/wc.cwl
    scatter: file
    in:
      file: cat/output
    out:
      - output
  progress2:
    run: ../tools/report-progress.cwl
    scatter: file
    in:
      step_name: { valueFrom: "wordcount" }
      step_status: { valueFrom: "complete" }
      file: wordcount/output
    out: []
