#!/usr/bin/env python

import sys, os
import getopt

VENDOR='org.rudix'

Index = '''<?xml version="1.0"?>
<pkmkdoc spec="1.12">
  <properties>
    <title>{title}</title>
    <organization>{vendor}</organization>
    <userSees ui="easy"/>
    <min-target os="3"/>
    <domain anywhere="true"/>
  </properties>
  <distribution>
    <versions min-spec="1.000000"/>
    <scripts/>
  </distribution>
  <description>{description}</description>
  <contents>
    <choice title="{name}-install" id="choice0" starts_selected="true" starts_enabled="true" starts_hidden="false">
      <pkgref id="{vendor}.pkg.{name}"/>
    </choice>
  </contents>
  <resources bg-scale="none" bg-align="topleft">
    <locale lang="en">
      <resource relative="true" mod="true" type="license">{license}</resource>
      <resource relative="true" mod="true" type="readme">{readme}</resource>
    </locale>
  </resources>
  <flags/>
  <item type="file">01{name}.xml</item>
  <mod>properties.title</mod>
  <mod>description</mod>
</pkmkdoc>
'''

def make_empty_pmdoc(pathname):
    if pathname.endswith('.pmdoc') is False:
        pathname = pathname + '.pmdoc'
    if os.path.isdir(pathname) is False:
        os.mkdir(pathname)

def output_index(name, title, description, readme, license, vendor=VENDOR):
    return Index.format(name=name, title=title, description=description, vendor=vendor, readme=readme, license=license)

def main(argv=None):
    if not argv:
        argv = sys.argv
    opts, args = getopt.getopt(argv[1:], 'n:v:t:d:l:r:', ['name=', 'version=', 'title=', 'description=', 'license=', 'readme='])
    for opt, arg in opts:
        if opt in ('-n', '--name'):
            name = arg
        if opt in ('-v', '--version'):
            version = arg
        if opt in ('-t', '--title'):
            title = arg
        if opt in ('-d', '--description'):
            description = arg
        if opt in ('-l', '--license'):
            license = arg
        if opt in ('-r', '--readme'):
            readme = arg
    try:
        path = args[0]
    except IndexError:
        path = '.'
    pmdoc = path + '/' + name + '.pmdoc'
    make_empty_pmdoc(pmdoc)
    with open(pmdoc + '/index.xml', 'w') as idx:
        idx.write(output_index(name=name, title=title, description=description, readme=readme, license=license))
    return 0

if __name__ == '__main__':
    sys.exit(main())
