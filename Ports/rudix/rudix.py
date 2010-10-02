#!/usr/bin/env python

'''Rudix Package Manager -- RPM ;D

Usage: rudix [-h|-v|-l|-R|-K|-u] [-I <pkg-path>|-L <package-id>|-i <package-id>|-r <package-id>|-S <path>|-V <package-id>|-f <package-id>|-n <package-id>]
List all installed packages unless options are given, like:
  -h    This help message
  -v    Print version
  -l    List all installed packages (print version and install date)
  -I    Print package information
  -L    List package content
  -i    Install package
  -r    Remove package
  -R    Remove *all* Rudix packages installed (ask to confirm)
  -S    Search for <path> in all packages and print if matched
  -V    Verify package
  -K    Verify all installed packages
  -f    Fix (repair) package
  -n    Download and install package
  -u    Download and install updated packages
'''

import sys
import os
import getopt
from subprocess import Popen, PIPE, call

__author__ = 'Ruda Moura'
__copyright__ = 'Copyright (c) 2005-2010 Ruda Moura <ruda@rudix.org>'
__credits__ = 'Ruda Moura, Leonardo Santagada'
__license__ = 'BSD'
__version__ = '@VERSION@'

PROG_NAME = os.path.basename(sys.argv[0])
PREFIX = 'org.rudix.pkg.'

def version():
    print 'Rudix Package Manager version %s' % __version__
    print __copyright__

def usage():
    print __doc__
    sys.exit(0)

def root_required():
    if os.getuid() != 0:
        print >> sys.stderr, '%s: this operation requires root privileges'%PROG_NAME
        sys.exit(1)

def communicate(args):
    'call a process and return its stdout data as a list of strings'
    proc = Popen(args, stdout=PIPE, stderr=PIPE)
    return proc.communicate()[0].split('\n')[:-1]

def get_packages():
    out = communicate(['pkgutil', '--pkgs=org.rudix.pkg.*'])
    pkgs = [line.strip() for line in out]
    return pkgs

def get_package_info(pkg):
    out = communicate(['pkgutil', '-v', '--pkg-info', pkg])
    version = None
    install_date = None
    for line in out:
        line = line.strip()
        if line.startswith('version: '):
            version = line[len('version: '):]
        elif line.startswith('install-time: '):
            install_date = line[len('install-time: '):]
    return version, install_date

def get_package_content(pkg):
    out = communicate(['pkgutil', '--files', pkg, '--only-files'])
    content = ['/'+line.strip() for line in out]
    return content

def print_package_info(pkg):
    version, install_date = get_package_info(pkg)
    if install_date is not None:
        print '%s version %s (install: %s)'%(pkg, version, install_date)
    else:
        print "No receipt for '%s' found at '/'."%pkg # pretend we are pkgutil

def list_all_packages():
    for pkg in get_packages():
        print pkg

def list_all_packages_info():
    for pkg in get_packages():
        print_package_info(pkg)

def list_package_files(pkg):
    content = get_package_content(pkg)
    for file in content:
        print file

def install_package(pkg):
    root_required()
    call(['installer', '-pkg', pkg, '-target', '/'], stderr=PIPE)

def remove_package(pkg):
    root_required()
    call(['pkgutil', '--unlink', pkg, '-f'], stderr=PIPE)
    call(['pkgutil', '--forget', pkg], stderr=PIPE)

def remove_all_packages():
    root_required()
    print "Using this option will remove *all* Rudix's packages!"
    print "Are you sure you want to proceed? (answer 'yes' or 'y' to confirm)"
    answer = raw_input().strip()
    if answer not in ['yes', 'y']:
        print 'Good!'
        return
    print 'Removing packages...'
    for pkg in get_packages():
        print pkg
        remove_package(pkg)
    # remember LinuxConf...
    print 'Cry a little tear because Rudix was removed'

def search_in_packages(path):
    out = communicate(['pkgutil', '--file-info', path])
    for line in out:
        line = line.strip()
        if line.startswith('pkgid: '):
            print line[len('pkgid: '):]

def verify_package(pkg):
    call(['pkgutil', '--verify', pkg], stderr=PIPE)

def verify_all_packages():
    for pkg in get_packages():
        verify_package(pkg)

def fix_package(pkg):
    root_required()
    call(['pkgutil', '--repair', pkg], stderr=PIPE)

def find_net_info(pkg):
    'Search the download page for versions of pkg'
    from urllib2 import urlopen
    import re
    pkg = denormalize(pkg)
    cont = urlopen('http://code.google.com/p/rudix/downloads/list?q=%s'%pkg).read()
    urls = re.findall('(http://rudix.googlecode.com/files/(%s-([0-9.]*)-?[0-9]*\.dmg))'%pkg, cont)
    versions = sorted(list(set(urls)), key=lambda i: i[1])
    if len(versions) == 0:
        return None
    else:
        return versions[-1]

def net_install_package(pkg, net_info):
    root_required()
    net_url, net_filename, net_version = net_info
    print 'Downloading package %s, version %s'%(pkg, net_version)
    call(['curl', '-O', net_url])
    print 'Mounting downloaded image', net_filename
    out = communicate(['hdiutil', 'attach', net_filename])
    for l in out:
        if 'Apple_partition_scheme' in l:
            disk_path = l.split()[0]
        if 'Apple_HFS' in l:
            volume_path = l.split()[2]

    install_package(os.path.join(volume_path, pkg+'.pkg'))
    print 'Unmounting image', net_filename
    call(['hdiutil', 'detach', disk_path], stdout=PIPE, stderr=PIPE)
    
def net_install_command(pkg):
    'Install a pkg from the internet if the pkg was not installed or is older than the internet version'
    net_info = find_net_info(pkg)
    if net_info is None:
        print "Package '%s' not found online"%pkg
        return
    if version >= net_info[2]:
        print 'Latest version of package %s(%s) already installed'%(pkg, version)
        return
    net_install_package(pkg, net_info)
    print 'All done'

def update_all_packages():
    to_update = []
    # take each package, go to the internet and see if there is a newer version
    for pkg in get_packages():
        net_info = find_net_info(pkg)
        version, install_date = get_package_info(pkg)
        if net_info is None or version >= net_info[2]:
            continue
        print pkg, 'will be updated to version', net_info[2]
        to_update.append(net_info)
    if len(to_update) == 0:
        print 'All packages are up to date'
        return

    # if there is packages to update you need to be root
    root_required()
    for net_info in to_update:
        net_install_package(pkg, net_info)
    print 'All done'
    
def normalize(pkg):
    if not pkg.startswith(PREFIX):
        pkg = PREFIX + pkg
    return pkg

def denormalize(pkg):
    if pkg.startswith(PREFIX):
        pkg = pkg[len(PREFIX):]
    return pkg

def main(argv=None):
    if argv is None:
        argv = sys.argv

    if len(argv) == 1:
        list_all_packages()
        sys.exit(0)

    try:
        opts, args = getopt.getopt(argv[1:], "hI:lL:i:r:RS:vV:Kf:n:u")
    except getopt.error, msg:
        print >> sys.stderr, '%s: %s'%(PROG_NAME, msg)
        print >> sys.stderr, '\t for help use -h'
        sys.exit(2)

    # option processing
    for option, value in opts:
        if option == '-h':
            usage()
        if option == '-v':
            version()
        if option == '-I':
            print_package_info(normalize(value))
        if option == '-l':
            list_all_packages_info()
        if option == '-L':
            list_package_files(normalize(value))
        if option == '-i':
            install_package(value)
        if option == '-r':
            remove_package(normalize(value))
        if option == '-R':
            remove_all_packages()
        if option == '-S':
            search_in_packages(value)
        if option == '-V':
            verify_package(normalize(value))
        if option == '-K':
            verify_all_packages()
        if option == '-f':
            fix_package(normalize(value))
        if option == '-n':
            net_install_command(normalize(value))
        if option == '-u':
            update_all_packages()

if __name__ == "__main__":
    main()
