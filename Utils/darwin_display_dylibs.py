#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright (c) 2014-2017 Rudá Moura (Rudix)
# Author: Rudá Moura <ruda.moura@gmail.com>

import sys
import os
import glob
import re
import optparse

from subprocess import *

def find_my_dylibs(path):
    filenames = glob.glob(os.path.join(path, '*.dylib'))
    return [os.path.basename(x) for x in filenames]

def get_dylibs(path):
    cmd = ['otool', '-L', path]
    output = Popen(cmd, stdout=PIPE).communicate()[0]
    pat = re.compile(r'\t(\/.*\.dylib)')
    libs = re.findall(pat, output)
    return libs

def match_any(dylib, dylibs_suffix):
    match = False
    for x in dylibs_suffix:
        if dylib.endswith(x):
            match = True
    return match

def main():
    parser = optparse.OptionParser()
    parser.add_option('--exclude-from-path', default='.',
                      help='exclude libraries from path')
    parser.add_option('--exclude-osx', action='store_true', default=False,
                      help='exclude OS X libraries')
    parser.add_option('--verbose', action='store_true', default=False)
    (options, args) = parser.parse_args()
    for path in args:
        if options.verbose:
            print '%s:' % path
        libs = get_dylibs(path)
        if options.exclude_osx:
            libs = [x for x in libs if not '/usr/lib' in x]
        if options.exclude_from_path:
            my_libs = find_my_dylibs(options.exclude_from_path)
        for lib in libs:
            if options.exclude_from_path:
                if match_any(lib, my_libs):
                    continue
                else:
                    print '\t%s' % lib
    return 0


if __name__ == '__main__':
    sys.exit(main())

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
