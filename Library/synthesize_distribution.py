#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Copyright © 2013-2017 Rudá Moura (Rudix)
# Author: Rudá Moura <ruda.moura@gmail.com>
#
# Synthesize a Distribution file.
#

import sys
from getopt import getopt

Distribution = '''<?xml version="1.0" encoding="utf-8" standalone="no"?>
<installer-script minSpecVersion="1.000000" authoringTool="com.apple.PackageMaker" authoringToolVersion="3.0.6" authoringToolBuild="201">
    <title>{title}</title>
    <options customize="never" allow-external-scripts="no"/>
    <domains enable_anywhere="true"/>
    <background file="background" alignment="bottomleft" scaling="none"/>
    <welcome file="Welcome"/>
    <readme file="ReadMe"/>
    <license file="License"/>
    <choices-outline>
        <line choice="choice0"/>
    </choices-outline>
    <choice id="choice0" title="{name}-install">
        <pkg-ref id="{pkgid}"/>
    </choice>
    <pkg-ref id="{pkgid}" auth="Root">#{installpkg}</pkg-ref>
</installer-script>'''

DistributionMany = '''<?xml version="1.0" encoding="utf-8" standalone="no"?>
<installer-script minSpecVersion="1.000000" authoringTool="com.apple.PackageMaker" authoringToolVersion="3.0.6" authoringToolBuild="201">
    <title>{title}</title>
    <options customize="never" allow-external-scripts="no"/>
    <domains enable_anywhere="true"/>
    <background file="background" alignment="bottomleft" scaling="none"/>
    <welcome file="Welcome"/>
    <readme file="ReadMe"/>
    <license file="License"/>
{choices}
</installer-script>
'''

def synthesize(title, pkgid, name, installpkg, requires):
    if not requires:
        return Distribution.format(title=title, pkgid=pkgid, name=name, installpkg=installpkg)
    requires.insert(0, ','.join((pkgid, name, installpkg)))
    extra = ['    <choices-outline>']
    for n in range(len(requires)):
        extra.append('        <line choice="choice%d"/>' % n)
    extra.append('    </choices-outline>')
    n = 0
    for dep in requires:
        pkgid, name, installpkg = dep.split(',')
        extra.append('    <choice id="choice%d" title="%s-install">' % (n, name))
        extra.append('        <pkg-ref id="%s"/>' % pkgid)
        extra.append('    </choice>')
        n += 1
    for dep in requires:
        pkgid, name, installpkg = dep.split(',')
        extra.append('    <pkg-ref id="%s" auth="Root">%s</pkg-ref>' % (pkgid, installpkg))
    choices = '\n'.join(extra)
    return DistributionMany.format(title=title, choices=choices)

def main(argv=None):
    if not argv:
        argv = sys.argv
    requires = []
    output = 'Distribution'
    opts, args = getopt(argv[1:], '', ['title=', 'pkgid=', 'name=', 'installpkg=', 'requires=', 'output='])
    for opt, arg in opts:
        if opt == '--title':
            title = arg
        if opt == '--pkgid':
            pkgid = arg
        if opt == '--name':
            name = arg
        if opt == '--installpkg':
            installpkg = arg
        if opt == '--requires':
            requires.append(arg)
        if opt == '--output':
            output = arg
    with open(output, 'w') as dist:
        dist.write(synthesize(title, pkgid, name, installpkg, requires))


if __name__ == '__main__':
    sys.exit(main())
