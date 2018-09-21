cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
requirements:
  - class: InlineJavascriptRequirement
inputs:
  message:
    type: string
    default: 'task-expect'
  task_group: string
  task_array: File[]
outputs: []
arguments:
  - valueFrom: |
      ${
        var prefix = '# ' + inputs.message + ': ';
        var report = {date: new Date(),
                      message: inputs.message,
                      task_group: inputs.task_group,
                      task_count: inputs.task_array.count};
        return prefix + JSON.stringify(report);
      }
