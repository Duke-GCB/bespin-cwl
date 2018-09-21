cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
requirements:
  - class: InlineJavascriptRequirement
inputs:
  step_name: string
  step_status: string
  subject: string?
  file: File?
  files: File[]?
outputs: []
arguments:
  - valueFrom: |
      ${
        var prefix = '# bespin-progress-report: ';
        var d = new Date();
        var report = Object.assign({date: d}, inputs)
        return prefix + JSON.stringify(report);
      }
