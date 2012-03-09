#!/usr/bin/env python

import os
import string

template = '''#summary {Title}
#sidebar TableOfContents

<g:plusone size="small"></g:plusone>

= {Name} =

{Description}

= Download  =

Latest version:
  * [http://code.google.com/p/rudix/downloads/detail?name={PkgFile} {PkgFile}] Lion
  * [http://code.google.com/p/rudix-snowleopard/downloads/detail?name={PkgFile} {PkgFile}] Snow Leopard

All versions: [http://code.google.com/p/rudix/downloads/list?q={Name} Lion] [http://code.google.com/p/rudix-snowleopard/downloads/list?q={Name} Snow Leopard]

= Source =
  * [http://code.google.com/p/rudix/source/browse/Ports/{Name} Ports/{Name}]

= Bugs =
  * [http://code.google.com/p/rudix/issues/list?q={Name} Know issues]

'''

class Global_Env_Dict(object):
    def __getitem__(self, key):
        if key in globals():
            return globals()[key]
        else:
            return os.getenv(key)

f = open('Description')
Description = f.read()
f.close()

env = Global_Env_Dict()
fmt = string.Formatter()
output = fmt.vformat(template, None, env)

tbl = string.maketrans('-', '_')
wiki = '%s.wiki' % env['Name'].translate(tbl)
with open(wiki, 'w') as f:
    f.write(output)
