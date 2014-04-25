#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright © 2013-2014 Rudix
# Author: Rudá Moura <ruda.moura@gmail.com>

"""Create a new port for Rudix."""

Makefile = """include ../../Library/{formula}.mk

Title=		{title}
Name=		{name}
Version=	{version}
Revision=	{revision}
Site=           {site}
URL=		{url}
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
              'revision': '0',
              'site': args.site,
              'url': args.url,
              'source': args.source,
              'license': args.license,
    }
    if args.create_makefile:
        path = 'Makefile'
    else:
        path = '/dev/stdout'
    return create_makefile(params, path)


if __name__ == '__main__':
    import sys
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('name',
                        help='the name of the new port. Use all lowercase.')
    parser.add_argument('--version',
                        default='1.0',
                        help='set port version.')
    parser.add_argument('--title',
                        default=None,
                        help='set port title. Default to the same as name.')
    parser.add_argument('--site',
                        default='http://...',
                        help='set port original home page.')
    parser.add_argument('--url',
                        default='http://...',
                        help='set port base download page.')
    parser.add_argument('--source',
                        default='$(NAME)-$(VERSION).tar.gz',
                        help='set port source name and version format.')
    parser.add_argument('--license',
                        default='GPL',
                        help='set port license. Default to GPL.')
    parser.add_argument('--formula',
                        default='GNU',
                        help='set build formula to use. Default to GNU.')
    parser.add_argument('-y', '--create-makefile',
                        action='store_true',
                        help='create Makefile for the port in current dir.')
    args = parser.parse_args()
    sys.exit(process(args))

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
