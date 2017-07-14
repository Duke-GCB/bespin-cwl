#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: Extracts a read group header from the first file name in an array of files
requirements:
  - class: InlineJavascriptRequirement

inputs:
  reads:
    type: File[]
  library:
    type: string
  platform:
    type: string
  fieldOrder:
    type: string[]
    default:
      - sample
      - barcode
      - lane
      - read
      - part
  separator:
    type: string
    default: _
outputs:
  read_group_header:
    type: string

expression: >
  ${
    // Returns the part of the filename before the extension
    function removeExtension(name) {
      return name.split('.')[0];
    }

    // Given an array of keys and values, creates an object mapping keys to values
    function zip(keys, values) {
      var object = {};
      for (var i=0;i<keys.length;i++) {
        object[keys[i]] = values[i]
      }
      return object;
    }

    // Split the string name on the separator
    function splitFields(name, separator) {
    	return name.split(separator);
    }

    // Makes a string with a read group header that can be provided to bwa as SAM metadata
    function makeReadGroupsString(fields) {
      	var readGroups = "@RG" +
      	  "\\tID:" + fields['sample'] +
      	  "\\tLB:" + fields['library'] +
      	  "\\tPL:" + fields['platform'] +
      	  "\\tPU:" + fields['sample'] +
      	  "\\tSM:" + fields['sample'];
        return readGroups;
    }

    var filename = inputs.reads[0].basename;
    var base = removeExtension(filename);
    var components = splitFields(base, inputs.separator);
    var fields = zip(inputs.fieldOrder, components);
    fields['library'] = inputs.library;
    fields['platform'] = inputs.platform;
    var read_group_header = makeReadGroupsString(fields);

    return {
      read_group_header: read_group_header
    };
  }
