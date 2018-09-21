cwlVersion: v1.0
class: Workflow
label: Progress Reporting Demo
requirements:
  - class: StepInputExpressionRequirement
inputs:
  file1: File
outputs:
  output_file:
    type: File
    outputSource: wordcount/output
steps:
  cat:
    run: ../tools/cat.cwl
    in:
      file: file1
    out:
      - output
  progress1:
    run: ../tools/report-progress.cwl
    in:
      step_name: { valueFrom: "cat" }
      step_status: { valueFrom: "complete" }
      file: cat/output
    out: []
  wordcount:
    run: ../tools/wc.cwl
    in:
      file: file1
    out:
      - output
  progress2:
    run: ../tools/report-progress.cwl
    in:
      step_name: { valueFrom: "wordcount" }
      step_status: { valueFrom: "complete" }
      file: wordcount/output
    out: []
