#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Install packages.
#
# Copyright © 2014-2017 Rudá Moura (Rudix)
# Author: Rudá Moura <ruda.moura@gmail.com>

"""Install one or more packages on target volume."""

import os
import sys
# For Snow Leopard compatibility, we can't use argparse
import optparse

def installer(package, target):
    "Install package on target volume."
    installcmd = 'installer -target {target} -pkg {package}'
    return os.system(installcmd.format(target=target, package=package))

def install_packages(packages, target):
    "Install one or more packages on target volume."
    ok = True
    for package in packages:
        result = installer(package, flags.target)
        if result != 0:
            ok = False
    return 0 if ok else 1

if __name__ == '__main__':
    usage = 'usage: %prog [options] package ...'
    parser = optparse.OptionParser(usage=usage,
                                   version='%prog 2014.4')
    parser.add_option('--target', dest='target',
                      default='/',
                      help='Set target volume. Default: %default')
    flags, packages = parser.parse_args()
    sys.exit(install_packages(packages, flags.target))

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
