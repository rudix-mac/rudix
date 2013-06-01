#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import string

template = '''---
layout: package
title: Rudix • {Title}
description: {Summary}
---

# {Title} #

## {Name} ##
{Description}

### Downloads ###

<table class="table table-hover">
<tr>
  <th>Mac OS X</th>
  <th>Latest version</th>
  <th>Older versions</th>
</tr>
<tr>
  <td>Mountain Lion (10.8)</td>
  <td><a href="http://code.google.com/p/rudix-mountainlion/downloads/detail?name={PkgFile}">{PkgFile}</a></td>
  <td><a href="http://code.google.com/p/rudix-mountainlion/downloads/list?can=2&q={Name}">More...</a></td>
</tr>
<tr>
  <td>Lion (10.7)</td>
  <td><a href="http://code.google.com/p/rudix/downloads/detail?name={PkgFile}">{PkgFile}</a></td>
  <td><a href="http://code.google.com/p/rudix/downloads/list?can=2&q={Name}">More...</a></td>
</tr>
<tr>
  <td>Snow Leopard (10.6)</td>
  <td><a href="http://code.google.com/p/rudix-snowleopard/downloads/detail?name={PkgFile}">{PkgFile}</a></td>
  <td><a href="http://code.google.com/p/rudix-snowleopard/downloads/list?can=2&q={Name}">More...</a></td>
</tr>
</table>

### Files ###
{FileList}
'''

class Global_Env_Dict(object):
    def __getitem__(self, key):
        if key in globals():
            return globals()[key]
        else:
            return os.getenv(key)

    def __setitem__(self, key, value):
        globals()[key] = value

f = open('Description')
Description = f.read()
f.close()

Summary = Description.split('\n')[0]

env = Global_Env_Dict()

# FileList
lines = []
for root, dirnames, filenames in os.walk(env['Name']+'-install'):
    if filenames:
        for filename in filenames:
            lines.append('\t' + root[root.index('/'):] + os.sep + filename)
FileList = '\n'.join(lines)

fmt = string.Formatter()
output = fmt.vformat(template, None, env)

md = '%s.md' % env['Name']
with open(md, 'w') as f:
    f.write(output)
