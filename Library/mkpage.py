#!/usr/bin/env python

import os
import string

template = '''---
layout: package
title: {Title}
description: {Summary}
---

# {Name}: {Title} #

{Description}

## Downloads ##

* [{PkgFile}](http://code.google.com/p/rudix-mountainlion/downloads/detail?name={PkgFile}) | OS X Mountain Lion (10.8) | [Previous versions](http://code.google.com/p/rudix-mountainlion/downloads/list?can=2&q={Name})
* [{PkgFile}](http://code.google.com/p/rudix/downloads/detail?name={PkgFile}) | Mac OS X Lion (10.7) | [Previous versions](http://code.google.com/p/rudix/downloads/list?can=2&q={Name})
* [{PkgFile}](http://code.google.com/p/rudix-snowleopard/downloads/detail?name={PkgFile}) | Mac OS X Snow Leopard (10.6) | [Previous versions](http://code.google.com/p/rudix-snowleopard/downloads/list?can=2&q={Name})
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
fmt = string.Formatter()
output = fmt.vformat(template, None, env)

md = '%s.md' % env['Name']
with open(md, 'w') as f:
    f.write(output)
