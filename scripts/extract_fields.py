#!/usr/bin/env python

from cwltool.context import LoadingContext
from cwltool.workflow import default_make_tool
from cwltool.resolver import tool_resolver
from cwltool.load_tool import load_tool

import json
import sys
import ruamel

if len(sys.argv) < 2:
  print('Usage:', sys.argv[0], '<CWL URL>')
  exit(1)

url = sys.argv[1]

context = LoadingContext({"construct_tool_object": default_make_tool,
                          "resolver": tool_resolver,
                          "disable_js_validation": True})

parsed = load_tool(url + '#main', context)
fields = parsed.inputs_record_schema.get('fields')


# This handles JSON-serializing of CommentedMap/CommentedSeq
def json_default(obj):
    if isinstance(obj, ruamel.yaml.comments.CommentedMap):
        return obj._od
    if isinstance(obj, ruamel.yaml.comments.CommentedSeq):
        return obj._lst
    raise TypeError

print(json.dumps(fields, default=json_default, indent=2))
