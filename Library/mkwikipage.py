#!/usr/bin/env python

import os
import string

template = '''#summary {Description}
#sidebar TableOfContents

<g:plusone size="small"></g:plusone>

= Pool =
  * [http://code.google.com/p/rudix/downloads/detail?name={PkgFile} {PkgFile}]

= Port source =
  * [http://code.google.com/p/rudix/source/browse/Ports/{Name} Ports/{Name}]
'''

class Global_Env_Dict(object):
    def __getitem__(self, key):
        if key in globals():
            return globals()[key]
        else:
            return os.getenv(key)

env = Global_Env_Dict()
fmt = string.Formatter()
output = fmt.vformat(template, None, env)

tbl = string.maketrans('-', '_')
wiki = '%s.wiki' % env['Name'].translate(tbl)
with open(wiki, 'w') as f:
    f.write(output)
