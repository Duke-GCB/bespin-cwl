#!/usr/bin/env python

import json
import fileinput

REPORT_PREFIX = '# bespin-progress-report: '

def filter_dict(d, allowed_keys):
  return {k:v for (k,v) in d.items() if k in allowed_keys}

def process_report_line(report_line):
  report = line[len(REPORT_PREFIX):]
  report_dict = json.loads(report)
  keys = ['date','step_name','subject','step_status', 'file']
  report_dict = filter_dict(report_dict, keys)
  file_keys = ['basename','size']
  report_dict['file'] = filter_dict(report_dict['file'], file_keys)
  print(report_dict)

def process(line):
  if line.startswith(REPORT_PREFIX):
    process_report_line(line)
  else:
    return

for line in fileinput.input():
  process(line)
