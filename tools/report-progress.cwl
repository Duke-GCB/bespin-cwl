cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
requirements:
  - class: InlineJavascriptRequirement
inputs:
  report_prefix:
    type: string
    default: '# bespin-progress-report: '
  step_name: string
  step_status: string
  subject: string?
  file: File?
  files: File[]?
outputs: []
arguments:
  - valueFrom: |
      ${
        var prefix = inputs.report_prefix;
        var d = new Date();
        var report = Object.assign({date: d}, inputs)
        delete report.prefix
        return prefix + JSON.stringify(report);
      }
