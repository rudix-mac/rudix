#!/usr/bin/env python
#
# Copyright (c) 2010 Ruda Moura <ruda@rudix.org>
#

import sys, os, getopt, uuid

VENDOR='org.rudix'
UUID=str(uuid.uuid1()).upper()
ROOT_OWNER='root'
ROOT_GROUP='wheel'
ROOT_DIRMODE='16877'
ROOT_FILEMODE='33204'
ROOT_EXECMODE='33277'
ADMIN_OWNER='root'
ADMIN_GROUP='admin'
ADMIN_DIRMODE=''
ADMIN_FILEMODE=''
ADMIN_EXECMODE=''
EXCLUDE=('CVS', '.svn', '.cvsignore', '.cvspass', '.DS_Store')

def make_pmdocdir(name):
    try:
        os.mkdir(name + '.pmdoc')
    except OSError:
        return False
    return True

def save_to_file(filename, content):
    f = open(filename, 'w')
    f.write(content)
    f.close()

def get_permissions(filename):
    pass

def make_pkmkdoc(name, title, description, license, readme):
    xml = '''<?xml version="1.0"?>
<pkmkdoc spec="1.12">
    <properties>
        <title>{title}</title>
        <organization>{organization}</organization>
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
        <choice title="{name}-install" id="{name}" starts_selected="true" starts_enabled="true" starts_hidden="false">
            <pkgref id="{organization}.pkg.{name}"/>
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
    args = {
        'name': name,
        'title': title,
        'description': description,
        'license': license,
        'readme': readme,
        'organization': VENDOR,
    }
    filename = name + '.pmdoc/index.xml'
    save_to_file(filename, xml.format(**args))

def make_pkgref(name, version):
    xml = '''<?xml version="1.0"?>
<pkgref spec="1.12" uuid="{uuid}">
    <config>
        <identifier>{organization}.pkg.{name}</identifier>
    	<version>{version}</version>
    	<description/>
    	<post-install type="none"/>
    	<requireAuthorization/>
    	<installFrom relative="true" mod="true">{name}-install</installFrom>
    	<installTo>/</installTo>
    	<flags>
    		<followSymbolicLinks/>
    	</flags>
    	<packageStore type="internal"/>
    </config>
    <contents>
    	<file-list>01{name}-contents.xml</file-list>
    	<filter>/CVS$</filter>
    	<filter>/\.svn$</filter>
    	<filter>/\.cvsignore$</filter>
    	<filter>/\.cvspass$</filter>
    	<filter>/\.DS_Store$</filter>
    </contents>
</pkgref>
    '''
    args = {
        'name': name,
        'version': version,
        'uuid': UUID,
        'organization': VENDOR,
    }
    filename = name + '.pmdoc/' + '01' + name + '.xml'
    save_to_file(filename, xml.format(**args))

def make_pkgcontents(top):
    xml = '''<?xml version="1.0"?>
<pkg-contents spec="1.12">
{contents}
</pkg-contents>
'''
    mode = '<mod>mode</mod>'
    def f(node, owner, group, permission):
        xml = '<f n="{node}" o="{owner}" g="{group}" p="{permission}">'
        args = {
            'node': node,
            'owner': owner,
            'group': group,
            'permission': permission,
        }
        return xml.format(**args)
    contents = []
    toplevel = len(top.split(os.sep))
    for dirpath, dirnames, filenames in os.walk(top):
        level = len(dirpath.split(os.sep)) - toplevel
        #print dirpath
        #for dirname in dirnames:
        #    contents.append(f(dirname, ROOT_OWNER, ROOT_GROUP, ROOT_DIRMODE))
        contents.append('  '*level + f(os.path.basename(dirpath), ROOT_OWNER, ROOT_GROUP, ROOT_DIRMODE))
        for filename in filenames:
            perms = get_permissions(dirpath + os.sep + filename)
            contents.append('  '*(level+1) + f(filename, ROOT_OWNER, ROOT_GROUP, ROOT_FILEMODE))
        if not dirnames:
            contents.append('  '*level + '</f>')
    args = {
        'contents': '\n'.join(contents)
    }
    return xml.format(**args)

def make_pmdoc(name, version, title, description, license, readme, top):
    make_pmdocdir(name)
    make_pkmkdoc(name, title, description, license, readme)
    make_pkgref(name, version)

def main(argv=None):
    name = version = title = description = license = readme = None
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
        top = args[0]
    except IndexError:
        top = '.'
    make_pmdoc(name, version, title, description, license, readme, top)

if __name__ == '__main__':
    main()
