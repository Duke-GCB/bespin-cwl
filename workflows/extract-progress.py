#!/usr/bin/env python

import json
import fileinput

REPORT_PREFIX = '# bespin-progress-report: '

def process_report_line(report_line):
  report = line[len(REPORT_PREFIX):]
  report_dict = json.loads(report)
  print('Date: {} Step {}, Status {}'.format(report_dict.get('date'), report_dict.get('step_name'), report_dict.get('step_status')))

def process(line):
  if line.startswith(REPORT_PREFIX):
    process_report_line(line)
  else:
    return

for line in fileinput.input():
  process(line)
