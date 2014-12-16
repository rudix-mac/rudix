#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Test if a given file is universal binary (fat binary).
#
#            “You're the One for me, fatty” (Morrissey)
#
# Copyright © 2013-2014 Rudix
# Author: Rudá Moura <ruda.moura@gmail.com>

"""Test if a given file is Universal Binary (Fat Binary)."""

import sys
import os
from platform import mac_ver

ProductVersion = mac_ver()[0]

def _lipo_command(osx_version=ProductVersion):
    if osx_version.startswith('10.5.'):
        cmd = 'lipo {path} -verify_arch i386 ppc7400 || lipo {path} -verify_arch i386 ppc'
    elif osx_version.startswith('10.6.'):
        cmd = 'lipo {path} -verify_arch x86_64 i386'
    elif osx_version.startswith('10.7.'):
        cmd = 'lipo {path} -verify_arch x86_64 i386'
    elif osx_version.startswith('10.8.'):
        cmd = 'lipo {path} -verify_arch x86_64 i386'
    elif osx_version.startswith('10.9.'):
        cmd = 'lipo {path} -verify_arch x86_64 i386'
    elif osx_version.startswith('10.10.'):
        cmd = 'lipo {path} -verify_arch x86_64 i386'
    else:
        cmd = 'lipo {path} -verify_arch i386 ppc'
    return cmd

def fatty(path):
    lipo = _lipo_command()
    lipo = lipo.format(path=path)
    result = os.system(lipo)
    return result >> 8

if __name__ == '__main__':
    if sys.argv[1:]:
        sys.exit(fatty(sys.argv[1]))

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
