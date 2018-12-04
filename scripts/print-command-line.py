#!/usr/bin/env python

import sys
import json
from cwltool.context import LoadingContext, RuntimeContext
from cwltool.workflow import default_make_tool
from cwltool.resolver import tool_resolver
from cwltool.load_tool import load_tool

def load_job_order_dict(job_order_file):
    with open(job_order_file, 'r') as f:
        return json.load(f)

def print_command_line(cwl_tool_file, job_order):
    context = LoadingContext({"construct_tool_object": default_make_tool,
                          "resolver": tool_resolver,
                          "disable_js_validation": True})
    tool = load_tool(cwl_tool_file, context)
    rt = RuntimeContext()
    for job in tool.job(job_order, None, rt):
        print(' '.join(job.command_line))

if len(sys.argv) < 3:
  print('Usage:', sys.argv[0], '<tool.cwl> <job.json>')
  exit(1)

cwl_tool_file, job_order_file = sys.argv[1:3]
job_order = load_job_order_dict(job_order_file)
print_command_line(cwl_tool_file, job_order)
