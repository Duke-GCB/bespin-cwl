cwlVersion: v1.0
class: CommandLineTool
label: "qiime2: Applies a collection of diversity metrics (both phylogenetic and non-phylogenetic) to a feature table."

baseCommand: [mkdir, 'core-metrics-results']

hints:
  - $import: qiime2-docker-hint.yml

requirements:
  - class: InlineJavascriptRequirement

inputs:
  input_tree:
    inputBinding:
      prefix: --i-phylogeny
    label: Phylogenetic tree containing tip identifiers that correspond to the feature identifiers in the table
    type: File
  input_table:
    inputBinding:
      prefix: --i-table
    doc: The feature table containing the samples over which diversity metrics should be computed
    type: File
  sampling_depth:
    inputBinding:
      prefix: --p-sampling-depth
    label: The total frequency that each sample should be rarefied to prior to computing diversity metrics
    type: int
    default: 1080
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    label: Metadata file or artifact viewable as metadata
    type: File
  output_dir_name:
    inputBinding:
      prefix: --output-dir
    type: string
    label: name of the directory to contain the results
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
    type: File?
    outputBinding:
      glob: $(inputs.output_dir_name + '/bray_curtis_pcoa_results.qza')
  shannon_vector:
    type: File
    outputBinding:
      glob: $(inputs.output_dir_name + '/shannon_vector.qza')

baseCommand: ["qiime", "diversity", "core-metrics-phylogenetic"]
