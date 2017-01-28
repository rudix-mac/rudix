#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Remove packages.
#
# Copyright © 2011-2017 Rudá Moura (Rudix)
# Author: Rudá Moura <ruda.moura@gmail.com>

"""Remove one or more packages."""

import os
import sys
# For Snow Leopard compatibility, we can't use argparse
import optparse
from subprocess import Popen, PIPE
from fnmatch import fnmatch

FORBIDDEN = [ '/Applications',
              '/Library',
              '/Library/Python',
              '/Library/Python/2.?',
              '/Library/Python/2.?/site-packages',
              '/Network',
              '/System',
              '/Users',
              '/Volumes',
              '/bin',
              '/cores',
              '/dev',
              '/etc',
              '/home',
              '/mach_kernel'
              '/net',
              '/private',
              '/sbin',
              '/tmp',
              '/usr',
              '/var', ]

# Thanks João Sebastião de Oliveira Bueno for the classes above!

class Shell(object):
    def __getattribute__(self, attr):
        return Command(attr)

class Command(object):
    def __init__(self, command):
        self.command = command

    def __call__(self, params=None):
        args = [self.command]
        if params:
            args += params.split()
        return self.run(args)

    def run(self, args):
        p = Popen(args, stdout=PIPE, stderr=PIPE)
        out, err = p.communicate()
        if p.returncode == 0:
            return True, out.strip().splitlines()
        else:
            return False, err.strip().splitlines()


def get_package_metadata(package_id, target):
    sh = Shell()
    pkginfocmd = '--volume {target} --pkg-info {packageid}'
    ok, info = sh.pkgutil(pkginfocmd.format(target=target,
                                            packageid=package_id))
    if ok == False:
        raise IOError, 'Unknown package or name mispelled'
    info = [x.split(': ') for x in info]
    return dict(info)

def get_package_files(package_id, target):
    sh = Shell()
    filescmd = '--volume {target} --files {packageid}'
    ok, files = sh.pkgutil(filescmd.format(target=target,
                                           packageid=package_id))
    onlydirscmd = '--volume {target} --only-dirs --files {packageid}'
    ok, dirs = sh.pkgutil(onlydirscmd.format(target=target,
                                             packageid=package_id))
    # Files minus directories
    files = list(set(files) - set(dirs))
    # Guess AppStore receipt
    for dir in dirs:
        if dir.endswith('.app'):
            dirs.append(dir + '/Contents/_MASReceipt')
            files.append(dir + '/Contents/_MASReceipt/receipt')
            break
    return files, dirs

def forget_package(package_id, target):
    sh = Shell()
    forgetcmd = '--verbose --volume {target} --forget {packageid}'
    ok, msg = sh.pkgutil(forgetcmd.format(target=target,
                                          packageid=package_id))
    return msg

def is_forbidden(path):
    for pattern in FORBIDDEN:
        if fnmatch(path, pattern):
            return True
    return False

def remove_package(package_id, target, force=True, verbose=False):
    info = get_package_metadata(package_id, target)
    prefix = info['volume']
    if info['location']:
        prefix += info['location'] + os.sep
    files, dirs = get_package_files(package_id, target)
    files = [prefix+x for x in files]
    clean = True
    for path in files:
        if is_forbidden(path):
            continue
        try:
            os.remove(path)
        except OSError, e:
            clean = False
            print e
    dirs = [prefix+x for x in dirs]
    dirs.sort(lambda p1, p2: p1.count('/') - p2.count('/'),
              reverse=True)
    for dir in dirs:
        if is_forbidden(dir):
            continue
        try:
            os.rmdir(dir)
            if verbose:
                print 'Removing', dir
        except OSError, e:
            clean = False
            print e
    if force or clean:
        msg = forget_package(package_id, target)
        print msg[0]
    return clean

def remove_packages(packages_id, target):
    ok = True
    for package in packages:
        clean = remove_package(package, target)
        if not clean:
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
    sys.exit(remove_packages(packages, flags.target))

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
