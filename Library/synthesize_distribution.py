#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Copyright © 2013 Rudix
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

def synthesize(title, pkgid, name, installpkg):
    return Distribution.format(title=title, pkgid=pkgid, name=name, installpkg=installpkg)

def main(argv=None):
    if not argv:
        argv = sys.argv
    opts, args = getopt(argv[1:], '', ['title=', 'pkgid=', 'name=', 'installpkg=' ])
    for opt, arg in opts:
        if opt == '--title':
            title = arg
        if opt == '--pkgid':
            pkgid = arg
        if opt == '--name':
            name = arg
        if opt == '--installpkg':
            installpkg = arg
    with open('Distribution', 'w') as dist:
        dist.write(synthesize(title, pkgid, name, installpkg))
    
if __name__ == '__main__':
    sys.exit(main())
