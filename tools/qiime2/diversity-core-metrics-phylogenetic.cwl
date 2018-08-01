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
  rarefied_table_filename:
    type: string
    label: "Filename for the resulting rarefied feature table"
    default: rarefied_table.qza
    inputBinding:
      prefix: "--o-rarefied-table"
  faith_pd_vector_filename:
    type: string
    label: "Filename for the vector of Faith PD values by sample"
    default: faith_pd_vector.qza
    inputBinding:
      prefix: "--o-faith-pd-vector"
  observed_otus_vector_filename:
    type: string
    label: "Filename for the vector of Observed OTUs values by sample"
    default: observed_otus_vector.qza
    inputBinding:
      prefix: "--o-observed-otus-vector"
  shannon_vector_filename:
    type: string
    label: "Filename for the vector of Shannon diversity values by sample"
    default: shannon_vector.qza
    inputBinding:
      prefix: "--o-shannon-vector"
  evenness_vector_filename:
    type: string
    label: "Filename for the vector of Pielou's evenness values by sample"
    default: evenness_vector.qza
    inputBinding:
      prefix: "--o-evenness-vector"
  unweighted_unifrac_distance_matrix_filename:
    type: string
    label: "Filename for the matrix of unweighted UniFrac distances between pairs of samples"
    default: unweighted_unifrac_distance_matrix.qza
    inputBinding:
      prefix: "--o-unweighted-unifrac-distance-matrix"
  weighted_unifrac_distance_matrix_filename:
    type: string
    label: "Filename for the matrix of weighted UniFrac distances between pairs of samples"
    default: weighted_unifrac_distance_matrix.qza
    inputBinding:
      prefix: "--o-weighted-unifrac-distance-matrix"
  jaccard_distance_matrix_filename:
    type: string
    label: "Filename for the matrix of Jaccard distances between pairs of samples"
    default: jaccard_distance_matrix.qza
    inputBinding:
      prefix: "--o-jaccard-distance-matrix"
  bray_curtis_distance_matrix_filename:
    type: string
    label: "Filename for the matrix of Bray-Curtis distances between pairs of samples"
    default: bray_curtis_distance_matrix.qza
    inputBinding:
      prefix: "--o-bray-curtis-distance-matrix"
  unweighted_unifrac_pcoa_results_filename:
    type: string
    label: "Filename for the PCoA matrix computed from unweighted UniFrac distances between samples"
    default: unweighted_unifrac_pcoa_results.qza
    inputBinding:
      prefix: "--o-unweighted-unifrac-pcoa-results"
  weighted_unifrac_pcoa_results_filename:
    type: string
    label: "Filename for the PCoA matrix computed from weighted UniFrac distances between samples"
    default: weighted_unifrac_pcoa_results.qza
    inputBinding:
      prefix: "--o-weighted-unifrac-pcoa-results"
  jaccard_pcoa_results_filename:
    type: string
    label: "Filename for the PCoA matrix computed from Jaccard distances between samples"
    default: jaccard_pcoa_results.qza
    inputBinding:
      prefix: "--o-jaccard-pcoa-results"
  bray_curtis_pcoa_results_filename:
    type: string
    label: "Filename for the PCoA matrix computed from Bray-Curtis distances between samples"
    default: bray_curtis_pcoa_results.qza
    inputBinding:
      prefix: "--o-bray-curtis-pcoa-results"
  unweighted_unifrac_emperor_filename:
    type: string
    label: "Filename for the Emperor plot of the PCoA matrix computed from unweighted UniFrac"
    default: unweighted_unifrac_emperor.qzv
    inputBinding:
      prefix: "--o-unweighted-unifrac-emperor"
  weighted_unifrac_emperor_filename:
    type: string
    label: "Filename for the Emperor plot of the PCoA matrix computed from weighted UniFrac"
    default: weighted_unifrac_emperor.qzv
    inputBinding:
      prefix: "--o-weighted-unifrac-emperor"
  jaccard_emperor_filename:
    type: string
    label: "Filename for the Emperor plot of the PCoA matrix computed from Jaccard"
    default: jaccard_emperor.qzv
    inputBinding:
      prefix: "--o-jaccard-emperor"
  bray_curtis_emperor_filename:
    type: string
    label: "Filename for the Emperor plot of the PCoA matrix computed from Bray-Curtis"
    default: bray_curtis_emperor.qzv
    inputBinding:
      prefix: "--o-bray-curtis-emperor"

outputs:
  rarefied_table:
    type: File
    outputBinding:
      glob: $(inputs.rarefied_table_filename)
  faith_pd_vector:
    type: File
    outputBinding:
      glob: $(inputs.faith_pd_vector_filename)
  observed_otus_vector:
    type: File
    outputBinding:
      glob: $(inputs.observed_otus_vector_filename)
  shannon_vector:
    type: File
    outputBinding:
      glob: $(inputs.shannon_vector_filename)
  evenness_vector:
    type: File
    outputBinding:
      glob: $(inputs.evenness_vector_filename)
  unweighted_unifrac_distance_matrix:
    type: File
    outputBinding:
      glob: $(inputs.unweighted_unifrac_distance_matrix_filename)
  weighted_unifrac_distance_matrix:
    type: File
    outputBinding:
      glob: $(inputs.weighted_unifrac_distance_matrix_filename)
  jaccard_distance_matrix:
    type: File
    outputBinding:
      glob: $(inputs.jaccard_distance_matrix_filename)
  bray_curtis_distance_matrix:
    type: File
    outputBinding:
      glob: $(inputs.bray_curtis_distance_matrix_filename)
  unweighted_unifrac_pcoa_results:
    type: File
    outputBinding:
      glob: $(inputs.unweighted_unifrac_pcoa_results_filename)
  weighted_unifrac_pcoa_results:
    type: File
    outputBinding:
      glob: $(inputs.weighted_unifrac_pcoa_results_filename)
  jaccard_pcoa_results:
    type: File
    outputBinding:
      glob: $(inputs.jaccard_pcoa_results_filename)
  bray_curtis_pcoa_results:
    type: File
    outputBinding:
      glob: $(inputs.bray_curtis_pcoa_results_filename)
  unweighted_unifrac_emperor:
    type: File
    outputBinding:
      glob: $(inputs.unweighted_unifrac_emperor_filename)
  weighted_unifrac_emperor:
    type: File
    outputBinding:
      glob: $(inputs.weighted_unifrac_emperor_filename)
  jaccard_emperor:
    type: File
    outputBinding:
      glob: $(inputs.jaccard_emperor_filename)
  bray_curtis_emperor:
    type: File
    outputBinding:
      glob: $(inputs.bray_curtis_emperor_filename)

baseCommand: ["qiime", "diversity", "core-metrics-phylogenetic"]
