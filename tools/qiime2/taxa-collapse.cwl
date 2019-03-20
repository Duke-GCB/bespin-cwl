cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Collapse groups of features that have the same taxonomic assignment through the specified level"

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  table:
    inputBinding:
      prefix: --i-table
    label: Feature table to be collapsed
    type: File
  taxonomy_file:
    inputBinding:
      prefix: --i-taxonomy
    label: Taxonomic annotations for features in the provided feature table
    type: File
  collapse_level:
    inputBinding:
      prefix: --p-level
    label: The taxonomic level at which the features should be collapsed
    type: int
    default: 2
  collapsed_table:
    inputBinding:
      prefix: --o-collapsed-table
    label: The resulting feature table, where all features are now taxonomic annotations with the user-specified number of levels
    type: string
    default: 'coll-table.qza'
outputs:
  out_collapsed_table:
    type: File
    outputBinding:
      glob: $(inputs.collapsed_table)

baseCommand: ["qiime", "taxa", "collapse"]
