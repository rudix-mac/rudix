#!/usr/bin/env python

import os
import string

template = '''#summary {Description}.
#sidebar TableOfContents

= {Title} =
{Description}.
  * Site: {Site}
  * License: {License}
  * Port source: [http://code.google.com/p/rudix/source/browse/Ports/{Name} Ports/{Name}]

= Download =
  * [http://rudix.googlecode.com/files/{PkgFile} {PkgFile}]
'''

note_templ = '''
= Note =
{Note}'''

usage_templ = '''
= Usage =
<pre>
{Usage}</pre>
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

if os.path.isfile('note.txt'):
    with open('note.txt') as f:
        content = f.read()
    note = fmt.vformat(note_templ, None, {'Note': content})
    output += note

if os.path.isfile('usage.txt'):
    with open('usage.txt') as f:
        content = f.read()
    usage = fmt.vformat(usage_templ, None, {'Usage': content})
    output += usage

tbl = string.maketrans('-', '_')
wiki = '%s.wiki' % env['Name'].translate(tbl)
with open(wiki, 'w') as f:
    f.write(output)
