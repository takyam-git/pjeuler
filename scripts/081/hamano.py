#!/usr/bin/python

import sys

#print sys.version_info[0]
for line in open('/proc/cpuinfo'):
    a = line.split(':')
    if a[0] == 'model name\t':
        print a[1]
