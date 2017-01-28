#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Test if a given file is universal binary (fat binary).
#
#            “You're the One for me, fatty” (Morrissey)
#
# Copyright © 2013-2017 Rudá Moura (Rudix)
# Author: Rudá Moura <ruda.moura@gmail.com>
#

"""Test if a given file is Fat Binary.

Test if a given file is Fat Binary (Universal Binary).

Return code:
0 = Non-fat file.
1 = Fat file."""

import sys
import os
from platform import mac_ver


def fatty(path, osx_version):
    if osx_version.startswith('10.5.'):
        lipo = 'lipo {path} -verify_arch i386 ppc7400 || lipo {path} -verify_arch i386 ppc'
    else:
        lipo = 'lipo {path} -verify_arch x86_64 i386'
    lipo = lipo.format(path=path)
    result = os.system(lipo)
    return result >> 8


if __name__ == '__main__':
    if sys.argv[1:]:
        sys.exit(fatty(sys.argv[1], mac_ver()[0]))
