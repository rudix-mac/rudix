#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Copyright © 2013 Rudix
# Author: Rudá Moura <ruda.moura@gmail.com>
#
# Limitations:
# * Can only create GNU formulas.
# * Can't validate urls, license, etc.
#

import sys
import os
from getopt import getopt

Params = {
    'version': '1.2.3',
    'url': 'http://',
    'source': '$(Name)-$(Version).tar.gz',
    'site': 'http://',
    'license': 'GPL',
}

Makefile = '''include ../../Library/GNU.mk

Title=		{title}
Name=		{name}
Version=	{version}
Revision=	0
URL=		{url}
Source=		{source}
'''

Description = '''{description}.

* Site: {site}
* License: {license}

Release Notes:

* Adopted {title} version {version}

Installation and usage:

	sudo rudix install {name}
	{name} --help
'''

def usage():
    print 'Usage: [--help|--dont-create-dir] TAGS.'
    print 'Where TAGS are: title, name, version, url, source, license, site, description.'
    print 'Tag NAME is the only one required.'
    print '\nExample:'
    print sys.argv[0], "--name hello"
    print sys.argv[0], "--name hello --version 2.8 --url 'http://ftp.gnu.org/gnu/hello/'"
    print sys.argv[0], "--title 'GNU Hello' --name hello --version 2.8 --url 'http://ftp.gnu.org/gnu/hello/' --site 'http://www.gnu.org/software/hello/'"
    print '\nOutput: hello/Makefile and hello/Description'
    return 0

def mkdir(path):
    if not os.path.exists(path):
        os.mkdir(path)

def create_makefile(create_dir=False):
    if create_dir:
        mkdir(Params['name'])
        path = Params['name'] + os.sep + 'Makefile'
    else:
        path = 'Makefile'
    with open(path, 'w') as makefile:
        output = Makefile.format(**Params)
        makefile.write(output)

def create_description(create_dir=False):
    if create_dir:
        mkdir(Params['name'])
        path = Params['name'] + os.sep + 'Description'
    else:
        path = 'Description'
    with open(path, 'w') as description:
        output = Description.format(**Params)
        description.write(output)

def main(argv=None):
    create_dir = True
    if not argv:
        argv = sys.argv
    opts, args = getopt(argv[1:], '',
                        ['help', 'dont-create-dir', 'title=', 'name=', 'version=', 'url=', 'source=', 'description=', 'site=', 'license='])
    for opt, arg in opts:
        if opt == '--help':
            return usage()
        if opt == '--dont-create-dir':
            create_dir = False
        Params[opt[2:]] = arg
    # at least NAME is required
    if not Params.has_key('name'):
        usage()
        return 1
    if not Params.has_key('title'):
        Params['title'] = Params['name'].capitalize()
    if not Params.has_key('description'):
        Params['description'] = Params['title']
    if not Params.has_key('site'):
        Params['site'] = Params['url']
    create_makefile(create_dir)
    create_description(create_dir)
    return 0

if __name__ == '__main__':
    sys.exit(main())
