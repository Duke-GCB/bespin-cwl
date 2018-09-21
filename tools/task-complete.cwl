cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
requirements:
  - class: InlineJavascriptRequirement
inputs:
  message:
    type: string
    default: 'task-complete'
  task_group: string
  task_file: File
  status:
    type: string?
    default: 'complete'
outputs: []
arguments:
  - valueFrom: |
      ${
        var prefix = '# ' + inputs.message + ': ';
        var report = {date: new Date(),
                      message: inputs.message,
                      task_group: inputs.task_group,
                      task_file: inputs.task_file,
                      status: inputs.status};
        return prefix + JSON.stringify(report);
      }
