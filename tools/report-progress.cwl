cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
requirements:
  - class: InlineJavascriptRequirement
inputs:
  item_label: string
  item: string
  status_label: string
  status:: string
  file: File?
  files_label: string?
  files: File[]?
outputs: []
arguments:
  - valueFrom: |
      ${
        var prefix = '[progress-report ';
        var suffix = ']';
        var message = '';

        message = message + inputs.item_label + '=' + inputs.item;
        return prefix + message + suffix;
      }
