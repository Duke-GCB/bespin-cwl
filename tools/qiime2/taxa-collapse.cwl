cwlVersion: v1.0
class: CommandLineTool
label: qiime2: Collapse groups of features that have the same taxonomic assignment through the specified level

hints:
  - $import: qiime2-docker-hint.yml

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
