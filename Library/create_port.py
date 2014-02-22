#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Copyright © 2013-2014 Rudix
# Author: Rudá Moura <ruda.moura@gmail.com>

'''Create port for Rudix.'''

import sys
import os
import getopt
import cmd

DEFAULT = {
    'formula': 'GNU',
    'version': '1.2.3',
    'revision': '0',
    'source': '$(Name)-$(Version).tar.gz',
    'site': 'https://www.gnu.org/software/...',
    'url': 'http://ftp.gnu.org/gnu/...',
    'license': 'GPL', }

FORMULAS = ('GNU', 'Unix', 'Configure', 'Python')
LICENSES = ('GPL', 'LGPL', 'BSD', 'BSD-like', 'MIT', 'Apache License', 'Python License', 'Freeware', 'Public Domain')

Makefile = '''include ../../Library/{formula}.mk

Title=		{title}
Name=		{name}
Version=	{version}
Revision=	{revision}
Site=           {site}
URL=		{url}
Source=		{source}
License=        {license}
'''

def usage(progname):
    print 'Create a new port for Rudix.'
    print 'Usage:', progname, '[--help|--dont-create-dir] TAGS.'
    print 'Where TAGS are: formula, title, name, version, site, url, source, license.'
    print 'Tag name is mandatory, all others are optional.'
    print 'Example:'
    print progname, "--name hello"
    print progname, "--name hello --version 2.8 --url 'http://ftp.gnu.org/gnu/hello/'"
    print progname, "--title 'GNU Hello' --name hello --version 2.8 --url 'http://ftp.gnu.org/gnu/hello/' --site 'http://www.gnu.org/software/hello/'"
    print '\nOutput: hello/Makefile'
    return 0

def mkdir(path):
    if not os.path.exists(path):
        os.mkdir(path)

def create_makefile(create_dir=False):
    if create_dir:
        mkdir(DEFAULT['name'])
        path = os.path.join(DEFAULT['name'], 'Makefile')
    else:
        path = 'Makefile'
    with open(path, 'w') as makefile:
        output = Makefile.format(**DEFAULT)
        makefile.write(output)

def validate():
    print DEFAULT
    report = []
    if DEFAULT['formula'] not in FORMULAS:
        txt = 'Invalid formula %s. Use any of %s' % (DEFAULT['formula'], ', '.join(FORMULAS))
        report.append(txt)
    if DEFAULT['license'] not in LICENSES:
        txt = 'Invalid license %s. Use any of %s' % (DEFAULT['license'], ', '.join(LICENSES))
        report.append(txt)
    return report

def main(argv=None):
    create_dir = True
    if argv is None:
        argv = sys.argv
    opts, args = getopt.getopt(argv[1:], '',
                               ['help', 'dont-create-dir', 'formula=', 'title=', 'name=', 'version=', 'url=', 'source=', 'site=', 'license='])
    for opt, arg in opts:
        if opt == '--help':
            return usage(sys.argv[0])
        if opt == '--dont-create-dir':
            create_dir = False
        DEFAULT[opt[2:]] = arg
    # Tag name is mandatory
    if not DEFAULT.has_key('name'):
        usage(sys.argv[0])
        return 1
    if not DEFAULT.has_key('title'):
        DEFAULT['title'] = DEFAULT['name'].capitalize()
    if not DEFAULT.has_key('site'):
        DEFAULT['site'] = DEFAULT['url']
    result = validate()
    if result:
        for res in result:
            print res
    else:
        create_makefile(create_dir)
    return 0

if __name__ == '__main__':
    sys.exit(main())
