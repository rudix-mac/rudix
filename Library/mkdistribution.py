#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Copyright (c) 2012 Rudix
# Author: Rudá Moura
#

import os
import sys
import tempfile

def expand(pkg, path):
    cmd = 'pkgutil --expand %s %s' % (pkg, path)
    return os.system(cmd)

def expand_head(head, path):
    return expand(head, path)

def read_distfile(distfile):
    lines = open(distfile).readlines()
    pkgref = lines[-2]
    choice = lines[-5:-2]
    return pkgref, choice

def expand_package(pkg, path):
    tmpdir = tempfile.mktemp()
    expand(pkg, tmpdir)
    distfile = '%s/Distribution' % tmpdir
    pkgref, choice = read_distfile(distfile)
    cmd = 'mv %s/*.pkg %s/' % (tmpdir, path)
    return os.system(cmd), pkgref, choice

def expand_packages(head, packages, path):
    res = []
    for pkg in packages:
        print 'Expanding package', pkg
        status, pkgref, choice = expand_package(pkg, path)
        res.append((pkgref, choice))
    return res

def insert_info(pkgref, choice, count, lines):
    line_choice = '        <line choice="choice%d"/>\n' % count

    new_choice = []
    for line in choice:
        if 'choice id="choice0"' in line:
            line = line.replace('choice0', 'choice%d' % count)
        new_choice.append(line)
    choice = new_choice

    new_lines = []
    i = last = 0
    seen_pkgref = False
    for line in lines:
        if '</choices-outline>' in line:
            new_lines.extend(lines[last:i])
            new_lines.append(line_choice)
            last = i
        elif not seen_pkgref and '</pkg-ref>' in line:
            new_lines.extend(lines[last:i])
            new_lines.extend(choice)
            last = i
            seen_pkgref = True
        elif '</installer-script>' in line:
            new_lines.extend(lines[last:i])
            new_lines.append(pkgref)
            new_lines.append(line)
            last = i
        i += 1
    return new_lines

def update_distfile(infos, path):
    distfile = '%s/Distribution' % path
    lines = open(distfile).readlines()
    count = 1
    for info in infos:
        pkgref, choice = info
        lines = insert_info(pkgref, choice, count, lines)
        count += 1
    text = ''.join(lines)
    open(distfile, 'w').write(text)

def flatten(path, pkgpath):
    cmd = 'pkgutil --flatten %s %s' % (path, pkgpath)
    return os.system(cmd)

def create_distribution(pkgs):
    head = pkgs[0]
    deps = pkgs[1:]
    tmpdir = tempfile.mktemp()
    print 'Expanding head package', head
    expand_head(head, tmpdir)
    pkgsinfo = expand_packages(head, deps, tmpdir)
    update_distfile(pkgsinfo, tmpdir)
    pkgname = os.path.basename(head)
    print 'Creating distribution package', pkgname
    flatten(tmpdir, pkgname)

if __name__ == '__main__':
    pkgs = sys.argv[1:]
    create_distribution(pkgs)
