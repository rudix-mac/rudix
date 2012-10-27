#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# List or remove Mac OS X packages
# Copyright (c) 2011-2012 Rudá Moura
#

"""Poof is an utility to list or remove Mac OS X packages.

NO WARRANTY!

DON'T BLAME ME if you destroy your Mac OS X installation,
NEVER REMOVE com.apple.* packages unless you know what are you doing.

Usage:

List packages (but ignore from Apple).

    $ ./poof.py | grep -v apple
    com.accessagility.wifiscanner
    com.adobe.pkg.FlashPlayer
    com.amazon.Kindle
    com.christiankienle.CoreDataEditor
    com.ea.realracing2.mac.bv
    com.google.pkg.GoogleVoiceAndVideo
    com.google.pkg.Keystone
    com.Growl.GrowlHelperApp
    com.lightheadsw.caffeine
    com.Logitech.Control Center.pkg
    ...

Remove FlashPlayer (com.adobe.pkg.FlashPlayer).

    $ sudo ./poof.py com.adobe.pkg.FlashPlayer
    (Some error messages regarding directory is not empty)
    Forgot package 'com.adobe.pkg.FlashPlayer' on '/'.
"""

from subprocess import Popen, PIPE
import sys, os

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
            return True, out.strip().split('\n')
        else:
            return False, err.strip().split('\n')

def package_list():
    sh = Shell()
    sts, out = sh.pkgutil('--pkgs')
    return out

def package_info(package_id):
    sh = Shell()
    ok, info = sh.pkgutil('--pkg-info ' + package_id)
    if ok == False:
        raise IOError, 'Unknown package or name mispelled'
    info = [x.split(': ') for x in info]
    return dict(info)

def package_files(package_id):
    sh = Shell()
    ok, files = sh.pkgutil('--only-files --files ' + package_id)
    return files

def package_dirs(package_id):
    sh = Shell()
    ok, dirs = sh.pkgutil('--only-dirs --files ' + package_id)
    return dirs

def package_forget(package_id):
    sh = Shell()
    ok, msg = sh.pkgutil('--verbose --forget ' + package_id)
    return msg

def package_remove(package_id, force=True):
    info = package_info(package_id)
    prefix = info['volume']
    if info['location']:
        prefix += info['location'] + os.sep
    files = package_files(package_id)
    files = [prefix+x for x in files]
    clean = True
    for path in files:
        try:
            os.remove(path)
        except OSError, e:
            clean = False
            print e
    dirs = package_dirs(package_id)
    dirs.reverse()
    dirs = [prefix+x for x in dirs]
    for dir in dirs:
        try:
            os.rmdir(dir)
        except OSError, e:
            clean = False
            print e
    if force or clean:
        msg = package_forget(package_id)
        print msg[0]
    return clean

def main(argv=None):
    if argv == None:
        argv = sys.argv
    if len(argv) == 1:
        for pkg in package_list():
            print pkg
    for arg in argv[1:]: 
        package_remove(arg)
    return 0

if __name__ == '__main__':
    sys.exit(main())
