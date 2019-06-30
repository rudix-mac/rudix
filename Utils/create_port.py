#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright © 2013-2019 Rudix (Rudá Moura)
# Author: Rudá Moura <ruda.moura@gmail.com>
#

"""Create new port prototype."""

Makefile = """include ../../Library/{build}.mk

Title=		{title}
Name=		{name}
Version=	{version}
Site=		{site}
Source=		{source}
License=        {license}

define test_hook
$(BinDir)/{name} --version | grep $(Version)
endef
"""

def create_makefile(params, path):
    try:
        with open(path, 'w') as stream:
            output = Makefile.format(**params)
            stream.write(output)
    except:
        return 1
    else:
        return 0

def process(args):
    args.name = args.name.lower()
    if args.title is None:
        title = args.name.title()
    else:
        title = args.title
    params = {'build': args.build,
              'title':   title,
              'name':    args.name,
              'version': args.version,
              'site':    args.site,
              'source':  args.source,
              'license': args.license}
    if args.create:
        import os
        os.mkdir(args.name)
        path = os.path.join(args.name, 'Makefile')
    else:
        path = '/dev/stdout'
    return create_makefile(params, path)

def parse_arguments():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--name',
                        default='noname',
                        help='the name of the port. Use all lowercase.')
    parser.add_argument('--version',
                        default='1.0',
                        help='set version. Default: 1.0')
    parser.add_argument('--title',
                        help='set title. Default: name capitalized.')
    parser.add_argument('--site',
                        default='https://rudix.org/',
                        help='set home page.')
    parser.add_argument('--source',
                        default='https://rudix.org/download/$(Name)-$(Version).tar.gz',
                        help='set source URL, name and version format.')
    parser.add_argument('--license',
                        default='GPL',
                        help='set license. Default: GPL.')
    parser.add_argument('--build',
                        default='GNU',
                        help='set build style to use. Default: GNU.')
    parser.add_argument('--create',
                        action='store_true',
                        help='Create directory (with port name) and put the Makefile there.')
    try:
        args = parser.parse_args()
    except IOError as err:
        print err
        sys.exit(1)
    return args


if __name__ == '__main__':
    import sys
    sys.exit(process(parse_arguments()))
