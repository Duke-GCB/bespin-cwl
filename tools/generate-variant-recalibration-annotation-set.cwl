#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Given an ExomeseqStudyType returns an array of the annotations to use.
doc: >
  The InbreedingCoeff is a population level statistic that requires at least 10
  samples in order to be computed. For projects with fewer samples, or that
  includes many closely related samples (such as a family) please omit this
  annotation from the command line.
  From https://software.broadinstitute.org/gatk/documentation/article?id=1259
requirements:
  - class: InlineJavascriptRequirement
  - $import: ../types/bespin-types.yml
inputs:
  study_type:
    type: ../types/bespin-types.yml#ExomeseqStudyType
  base_annotations: string[]
outputs:
  annotations:
    type: string[]

expression: >
  ${
    var annotations = inputs.base_annotations;
    var inputStudyType = inputs.study_type;
    if(inputStudyType === "Large Population") {
      annotations.push("InbreedingCoeff");
    }
    return {"annotations": annotations };
  }
