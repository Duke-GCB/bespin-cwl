cwlVersion: v1.0
class: CommandLineTool
label: qiime2: Applies a collection of diversity metrics (both phylogenetic and non-phylogenetic) to a feature table.

baseCommand: [mkdir, 'core-metrics-results']

hints:
  - $import: qiime2-docker-hint.yml

inputs:
  input_tree:
    inputBinding:
      prefix: --i-phylogeny
    type: File
  input_table:
    inputBinding:
      prefix: --i-table
    type: File
  sampling_depth:
    inputBinding:
      prefix: --p-sampling-depth
    type: int
    default: 1080
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    type: File
  output_dir_name:
    inputBinding:
      prefix: --output-dir
    type: string
    default: 'core-metrics-results'

outputs:
  out_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir_name)
  faith_pd_vector:
    type: File
    outputBinding:
      glob: $(inputs.output_dir_name + '/faith_pd_vector.qza')
  evenness_vector:
    type: File
    outputBinding:
      glob: $(inputs.output_dir_name + '/evenness_vector.qza')
  unweighted_unifrac_distance_matrix:
    type: File
    outputBinding:
      glob: $(inputs.output_dir_name + '/unweighted_unifrac_distance_matrix.qza')
  unweighted_unifrac_pcoa_results:
    type: File
    outputBinding:
      glob: $(inputs.output_dir_name + '/unweighted_unifrac_pcoa_results.qza')
  bray_curtis_pcoa_results:
    type: File
    outputBinding:
      glob: $(inputs.output_dir_name + '/bray_curtis_pcoa_results.qza')

baseCommand: ["qiime", "diversity", "core-metrics-phylogenetic"]
