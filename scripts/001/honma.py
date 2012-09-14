#!/usr/bin/python
# encoding:utf-8
sum = 0
for i in range(1, 999):
    if i % 3 == 1 or i % 5 == 0:
        sum += i
print sum


