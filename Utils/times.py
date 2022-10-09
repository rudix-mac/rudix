#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Take times created from each build stage and display like a table (CSV),
# so we can have a measure of how long packages are taken to construct.
#
# Usage: go to any port, type 'make check' and then
# run ../../Library/times.py
#
# Copyright © 2022 Rudá Moura <ruda.moura@gmail.com>
#

import os, sys, time

Stages = ['prep', 'config.cache', 'build', 'check', 'install', 'pkg']
RelativeTimes = {}

last = time.time()
for stage in Stages:
    try:
        stat = os.stat(stage)
    except OSError:
        continue
    delta = stat.st_ctime - last
    RelativeTimes[stage] = delta
    last = stat.st_ctime

if not RelativeTimes:
    sys.exit(1)

print 'Stage,Seconds'
for stage in Stages[1:]:
    if stage not in RelativeTimes:
        continue
    print '%s,%f' % (stage, RelativeTimes[stage])
