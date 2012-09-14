#!/usr/bin/python
# encoding:utf-8
import sys
import os
import time
from StringIO import StringIO
buffer = StringIO()
if len(sys.argv) == 1 or os.path.exits(sys.argv[1]):
    print "999.999\nERROR SCRIPT NOT FOUND"
    quit()

inputfile = open(sys.argv[1],  'r')
code = inputfile.read()
inputfile.close()

sys.stdout = buffer
start = time.time()
exec code
end = time.time()

sys.stdout = sys.__stdout__
print end-start
print buffer.getvalue()
