cwlVersion: v1.0
class: Workflow
label: Progress Reporting Demo
requirements:
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement
  - class: ScatterFeatureRequirement
inputs:
  files: File[]
outputs:
  output_file:
    type: File[]
    outputSource: wordcount/output
steps:
  expect_cat:
    run: ../tools/task-expect.cwl
    in:
      task_group: { valueFrom: 'cat' }
      task_array: files
    out: []
  cat:
    scatter: file
    run: ../tools/cat.cwl
    in:
      file: files
    out:
      - output
  complete_cat:
    run: ../tools/task-complete.cwl
    scatter: task_file
    in:
      task_group: { valueFrom: 'cat' }
      task_file: cat/output
    out: []
  expect_wordcount:
    run: ../tools/task-expect.cwl
    in:
      task_group: { valueFrom: 'wordcount' }
      task_array: cat/output
    out: []
  wordcount:
    run: ../tools/wc.cwl
    scatter: file
    in:
      file: cat/output
    out:
      - output
  complete_wordcount:
    run: ../tools/task-complete.cwl
    scatter: task_file
    in:
      task_group: { valueFrom: 'wordcount' }
      task_file: wordcount/output
    out: []
