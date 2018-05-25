class: CommandLineTool

requirements:
- class: DockerRequirement
  dockerPull: qiime2/core:2018.4
- class: InlineJavascriptRequirement


inputs:
  table:
    inputBinding:
      prefix: --i-table
    type: File
  taxonomy_file:
    inputBinding:
      prefix: --i-taxonomy
    type: File
  collapse_level:
    inputBinding:
      prefix: --p-level
    type: int
    default: 2
  collapsed_table:
    inputBinding:
      prefix: --o-collapsed-table
    type: string
    default: 'coll-table.qza'
outputs:
  out_collapsed_table:
    type: File
    outputBinding:
      glob: $(inputs.collapsed_table)

baseCommand: ["qiime", "taxa", "collapse"]
