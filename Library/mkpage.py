#!/usr/bin/env python

import os
import string

template = '''---
layout: package
title: {Title}
description: {Summary}
pkg-mountainlion: {PkgFile}
pkg-lion: {PkgFile}
pkg-snowleopard: {PkgFile}
---

# {Name}: {Title} #

{Description}

## Install ##

	sudo rudix install {Name}

## Usage ##

	/usr/local/bin/

## Manifest ##

	/usr/local/...
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
