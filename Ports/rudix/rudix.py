#!/usr/bin/env python

'''Rudix Package Manager -- RPM ;D

Usage: rudix [-h|-v|-l|-R|-K|-u] [-I <pkg-path>|-L <package-id>|-i <package-id>|-r <package-id>|-S <path>|-V <package-id>|-f <package-id>|-n <package-id>]
List all installed packages (package-id) unless options are given, like:
  -h    This help message
  -v    Print version
  -l    List all installed packages (package-id, version and install date)
  -I    Print package information (package-id, version and install date)
  -L    List package content
  -i    Install package (download if not a file)
  -r    Remove package
  -R    Remove *all* Rudix packages installed (ask to confirm)
  -S    Search for <path> in all packages and print if matched
  -V    Verify package
  -K    Verify all installed packages
  -f    Fix (repair) package
  -n    Download and install package (remote install)
  -u    Download and install all updated packages (remote update)

Where <package-id> is either org.rudix.pkg.<name> or <name>.
'''

import sys
import os
import getopt
import tempfile
import re
from subprocess import Popen, PIPE, call
from urllib2 import urlopen

__author__ = 'Ruda Moura'
__copyright__ = 'Copyright (c) 2005-2010 Ruda Moura <ruda@rudix.org>'
__credits__ = 'Ruda Moura, Leonardo Santagada'
__license__ = 'BSD'
__version__ = '@VERSION@'

PROGRAM_NAME = os.path.basename(sys.argv[0])
PREFIX = 'org.rudix.pkg.'

def rudix_version():
    'Print version and exit'
    print 'Rudix Package Manager version %s' % __version__
    print __copyright__

def usage():
    'Print help and exit'
    print __doc__

def root_required():
    'Check for root and pass or exit if not'
    if os.getuid() != 0:
        print >> sys.stderr, '%s: this operation requires root privileges'%PROGRAM_NAME
        sys.exit(1)

def communicate(args):
    'Call a process and return its stdout data as a list of strings'
    proc = Popen(args, stdout=PIPE, stderr=PIPE)
    return proc.communicate()[0].split('\n')[:-1]

def is_package_installed(pkg):
    'Test if pkg is installed'
    pkg = normalize(pkg)
    out = communicate(['pkgutil', '--pkg-info', pkg])
    for line in out:
        if line.startswith('install-time: '):
            return True
    return False

def is_package_with_version_installed(pkg, version):
    'Test if pkg with version is installed'
    pkg = normalize(pkg)
    current = None
    out = communicate(['pkgutil', '--pkg-info', pkg])
    for line in out:
        if line.startswith('version: '):
            current = line[len('version: '):]
        if line.startswith('install-time: '):
            break
    if current == None:
        return False
    if version_compare(current, version) == 0:
        return True
    else:
        return False

def get_packages():
    'Get a list of packages installed'
    out = communicate(['pkgutil', '--pkgs=' + PREFIX + '*'])
    pkgs = [line.strip() for line in out]
    return pkgs

def get_package_info(pkg):
    'Get information from pkg'
    pkg = normalize(pkg)
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
    'Get a list of file names from pkg'
    pkg = normalize(pkg)
    out = communicate(['pkgutil', '--files', pkg, '--only-files'])
    content = ['/'+line.strip() for line in out]
    return content

def print_package_info(pkg):
    'Print information about pkg'
    version, install_date = get_package_info(pkg)
    if install_date is not None:
        print '%s version %s (install: %s)'%(pkg, version, install_date)
    else:
        print "No receipt for '%s' found at '/'."%pkg # pretend we are pkgutil

def list_all_packages():
    'List all packages installed'
    for pkg in get_packages():
        print pkg

def list_all_packages_info():
    'List all packages installed, more detailed'
    for pkg in get_packages():
        print_package_info(pkg)

def list_package_files(pkg):
    'Print the file names of pkg'
    content = get_package_content(pkg)
    for file in content:
        print file

def install_package(pkg):
    'Install a local pkg'
    root_required()
    call(['installer', '-pkg', pkg, '-target', '/'], stderr=PIPE)

def remove_package(pkg):
    'Uninstall a pkg'
    root_required()
    pkg = normalize(pkg)
    devnull = open('/dev/null')
    call(['pkgutil', '--unlink', pkg, '-f'], stderr=devnull)
    call(['pkgutil', '--forget', pkg], stderr=devnull)
    devnull.close()

def remove_all_packages():
    'Uninstall all packages'
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
    'Search for path in all packages'
    out = communicate(['pkgutil', '--file-info', path])
    for line in out:
        line = line.strip()
        if line.startswith('pkgid: '):
            print line[len('pkgid: '):]

def verify_package(pkg):
    'Verify pkg sanity'
    pkg = normalize(pkg)
    call(['pkgutil', '--verify', pkg], stderr=PIPE)

def verify_all_packages():
    'Verify all packages sanity'
    for pkg in get_packages():
        verify_package(pkg)

def fix_package(pkg):
    'Try to fix permissions and groups of pkg'
    root_required()
    pkg = normalize(pkg)
    call(['pkgutil', '--repair', pkg], stderr=PIPE)

def version_compare(v1, v2):
    from distutils.version import LooseVersion
    # remove the release if it is 0
    if v1.endswith('-0'): v1 = v1[:-2]
    if v2.endswith('-0'): v2 = v2[:-2]
    return cmp(LooseVersion(v1), LooseVersion(v2))

def get_versions_for_package(pkg):
    'Get a list of available versions for pkg'
    pkg = denormalize(pkg)
    content = urlopen('http://code.google.com/p/rudix/downloads/list?q=Filename:%s' % pkg).read()
    urls = re.findall('(http://rudix.googlecode.com/files/(%s-([\w.]+(?:-[0-9]+)?(?:.i386)?)\.dmg))' % pkg, content)
    versions = sorted(list(set(urls)),
                      cmp=lambda x, y: version_compare(x[1], y[1]))
    if len(versions) == 0:
        return None
    else:
        return versions

def get_latest_version_of_package(pkg):
    versions = get_versions_for_package(pkg)
    return versions[-1]

def net_install_package(pkg, net_info):
    'Support function for net_install_command'
    root_required()
    net_url, net_filename, net_version = net_info
    print 'Downloading', net_url
    tempf, file_path = tempfile.mkstemp()
    try:
        call(['curl', '-f', '-o', file_path, '-C', '-', '-L', '-#', net_url])
        print 'Mounting downloaded image file', file_path
        out = communicate(['hdiutil', 'attach', file_path])
        for l in out:
            if 'Apple_partition_scheme' in l:
                disk_path = l.split()[0]
            if 'Apple_HFS' in l:
                volume_path = l.split()[2]

        install_package(os.path.join(volume_path, denormalize(pkg)+'.pkg'))
        print 'Unmounting image', volume_path
        call(['hdiutil', 'detach', disk_path], stdout=PIPE, stderr=PIPE)
    finally:
        os.close(tempf)

def net_install_command(pkg):
    'Install a pkg from the internet if the pkg was not installed or is older than the internet version'
    #net_info = find_net_info(pkg)
    net_info = get_latest_version_of_package(pkg)
    version, install_date = get_package_info(pkg)
    if net_info is None:
        print "Package '%s' not found online"%pkg
        return
    if version is not None and version_compare(version, net_info[2]) >= 0:
        print 'Latest version of package %s(%s) already installed'%(pkg, version)
        return
    net_install_package(pkg, net_info)
    print 'All done'

def update_all_packages():
    'Try to update the current base of packages'
    to_update = []
    # take each package, go to the internet and see if there is a newer version
    for pkg in get_packages():
        net_info = find_net_info(pkg)
        version, install_date = get_package_info(pkg)
        if net_info is None or version_compare(version, net_info[2]) >= 0:
            continue
        print '{0:25} {1:10} will be updated to version {2}'.format(denormalize(pkg), version, net_info[2])
        to_update.append((pkg, net_info))
    if len(to_update) == 0:
        print 'All packages are up to date'
        return
    # if there is packages to update you need to be root
    root_required()
    for pkg, net_info in to_update:
        net_install_package(pkg, net_info)
    print 'All done'

def normalize(pkg):
    'Transform pkg in full pkg-id (with PREFIX)'
    if not pkg.startswith(PREFIX):
        pkg = PREFIX + pkg
    return pkg

def denormalize(pkg):
    'Transform pkg in name without PREFIX'
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
        print >> sys.stderr, '%s: %s'%(PROGRAM_NAME, msg)
        print >> sys.stderr, '\t for help use -h'
        sys.exit(2)
    # option processing
    for option, value in opts:
        if option == '-h':
            usage()
            sys.exit(0)
        if option == '-v':
            rudix_version()
            sys.exit(0)
        if option == '-I':
            print_package_info(normalize(value))
        if option == '-l':
            list_all_packages_info()
        if option == '-L':
            list_package_files(normalize(value))
        if option == '-i':
            if os.path.isfile(value):
                install_package(value)
            else:
                net_install_command(normalize(value))
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
