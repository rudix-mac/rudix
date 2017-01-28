#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright © 2013-2017 Rudá Moura (Rudix)
# Author: Rudá Moura <ruda.moura@gmail.com>

"""Create a new port for Rudix."""

Makefile = """include ../../Library/{formula}.mk

Title=		{title}
Name=		{name}
Version=	{version}
Site=		{site}
Source=		{source}
License=        {license}
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
    if args.title is None:
        title = args.name.title()
    else:
        title = args.title
    params = {'formula': args.formula,
              'name': args.name,
              'title': title,
              'version': args.version,
              'site': args.site,
              'source': args.source,
              'license': args.license,
    }
    if args.create:
        import os
        os.mkdir(args.name)
        path = os.path.join(args.name, 'Makefile')
    else:
        path = '/dev/stdout'
    return create_makefile(params, path)


if __name__ == '__main__':
    import sys
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('name',
                        help='the name of the port. Use all lowercase.')
    parser.add_argument('--version',
                        default='1.2.3',
                        help='set version.')
    parser.add_argument('--title',
                        default='My Package',
                        help='set title. Default: equals to name.')
    parser.add_argument('--site',
                        default='http://example.org/',
                        help='set home page.')
    parser.add_argument('--source',
                        default='http://example.org/$(Name)-$(Version).tar.gz',
                        help='set source name and version format.')
    parser.add_argument('--license',
                        default='GPL',
                        help='set license. Default: GPL.')
    parser.add_argument('--formula',
                        default='GNU',
                        help='set build formula to use. Default: GNU.')
    parser.add_argument('--create',
                        action='store_true',
                        help='create directory and Makefile.')
    args = parser.parse_args()
    sys.exit(process(args))

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
