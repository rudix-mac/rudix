#!/usr/bin/env python

'''Rudix Package Manager -- RPM ;D

Usage:
rudix [help|version|available|aliases|list|remove-all|verify-all|update|interactive]
      [info <package-id>|files <package-id>|install <package-id>|remove <package-id>|search <package-id>|owner <path>|verify <package-id>|fix <package-id>]

rudix [-h|-v|-a|-A|-l|-R|-K|-u|-z]
      [-I <package-id>|-L <package-id>|-i <package-id>|-r <package-id>|-s <package-id>|-S <path>|-V <package-id>|-f <package-id>|-n <package-id>]

List all installed packages (package-id) unless options are given, like:
  -h    This help message
  -v    Print version
  -a    List all packages available for installation (name-version-release)
  -A    List all alternative aliases
  -l    List all installed packages (package-id, version and install date)
  -I    Print package information (package-id, version and install date)
  -L    List content of package (files)
  -i    Install package (download if not a file)
  -r    Remove package
  -R    Remove *all* Rudix packages installed (ask to confirm)
  -s    List available versions for package-id
  -S    Search for <path> in all packages and print if matched
  -V    Verify package
  -K    Verify all installed packages
  -f    Fix (repair) package
  -n    Download and install package (remote install)
  -u    Download and install all updated packages (remote update)
  -z    Interactive mode (type exit to quit)

Where <package-id> is either org.rudix.pkg.<name> or <name>.
'''

import sys
import os
import getopt
import tempfile
import re
from StringIO import StringIO
from gzip import GzipFile
from subprocess import Popen, PIPE, call
from urllib2 import urlopen, Request
from platform import mac_ver

__author__ = 'Ruda Moura'
__copyright__ = 'Copyright (c) 2005-2012 Ruda Moura'
__credits__ = 'Ruda Moura, Leonardo Santagada'
__license__ = 'BSD'
__version__ = '@VERSION@'

PROGRAM_NAME = os.path.basename(sys.argv[0])
PREFIX = 'org.rudix.pkg.'
OSX_VERSION = [int(x) for x in mac_ver()[0].split('.')[0:2]] # (MAJOR, MINOR)
RUDIX_NAMES = {
    (10, 6): 'rudix-snowleopard',
    (10, 7): 'rudix',
}
RUDIX = RUDIX_NAMES.get(tuple(OSX_VERSION), 'rudix')
VERSION = 2012

NAME_OPTS = {
    'help': '-h',
    'version': '-v',
    'aliases': '-A',
    'available': '-a',
    'list': '-l', 'ls': '-l', 'dir': '-l',
    'info': '-I', 'about': '-I',
    'install': '-i',
    'uninstall': '-r', 'remove': '-r',
    'uninstall-all': '-R', 'remove-all': '-R',
    'files': '-L', 'content': '-L',
    'search': '-s', 'versions': '-s',
    'owner': '-S',
    'verify': '-V', 'check': '-V',
    'verify-all': '-K',
    'fix': '-f',
    'update': '-u', 'upgrade': '-u',
    'repl': '-z', 'interactive': '-z',
}

ALIASES = {
    'aria': 'aria2',
    'awk': 'gawk',
    'bazaar': 'bzr',
    'exuberant': 'ctags', 'exuberant-ctags': 'ctags',
    'fab': 'fabric',
    'gnumake': 'make',
    'hg': 'mercurial',
    'memcache': 'memcached',
    'nodejs': 'node',
    'pkgconfig': 'pkg-config',
    'rdiff': 'librsync', 'rdiffbackup': 'rdiff-backup',
    'ssh': 'python-ssh',
    'svn': 'subversion',
    'supervisord': 'supervisor',
    'tofrodos': 'dos2unix',
    'tomcat': 'tomcat6',
    'unix2dos': 'dos2unix',
}

def rudix_version():
    'Print current Rudix version'
    print 'Rudix Package Manager version %s' % __version__
    print __copyright__

def usage():
    'Print help'
    print __doc__

def _is_root():
    'Test for root privileges'
    return os.getuid() == 0

def _root_required():
    'Requires root message'
    print >> sys.stderr, '%s: this operation requires root privileges' % PROGRAM_NAME
    return 1

def _communicate(args):
    'Call a process and return its stdout data as a list of strings'
    proc = Popen(args, stdout=PIPE, stderr=PIPE)
    return proc.communicate()[0].split('\n')[:-1]

def is_package_installed(pkg):
    'Test if package is installed'
    pkg = normalize(pkg)
    out = _communicate(['pkgutil', '--pkg-info', pkg])
    for line in out:
        if line.startswith('install-time: '):
            return True
    return False

def is_package_with_version_installed(pkg, version):
    'Test if package with version is installed'
    pkg = normalize(pkg)
    current = None
    out = _communicate(['pkgutil', '--pkg-info', pkg])
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
    out = _communicate(['pkgutil', '--pkgs=' + PREFIX + '*'])
    pkgs = [line.strip() for line in out]
    return pkgs

def get_package_info(pkg):
    'Get information from package'
    pkg = normalize(pkg)
    out = _communicate(['pkgutil', '-v', '--pkg-info', pkg])
    version = None
    install_date = None
    for line in out:
        line = line.strip()
        if line.startswith('version: '):
            version = line[len('version: '):]
        elif line.startswith('install-time: '):
            install_date = line[len('install-time: '):]
    return version, install_date

def get_package_content(pkg, filter_dirs=True):
    'Get a list of file names from package'
    pkg = normalize(pkg)
    out = _communicate(['pkgutil', '--files', pkg])
    content = ['/'+line.strip() for line in out]
    if filter_dirs:
        content = [x for x in content if os.path.isfile(x)]
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
    'Print the file names of package'
    content = get_package_content(pkg)
    for file in content:
        print file

def install_package(pkg):
    'Install a local package'
    if _is_root():
        call(['installer', '-pkg', pkg, '-target', '/'], stderr=PIPE)
    else:
        _root_required()

def remove_package(pkg):
    'Uninstall a package'
    if _is_root() == False:
        return _root_required()
    pkg = normalize(pkg)
    for x in get_package_content(pkg):
        try:
            os.unlink(x)
        except OSError, e:
            print >> sys.stderr, e
    with open('/dev/null') as devnull:
        call(['pkgutil', '--forget', pkg], stderr=devnull)

def remove_all_packages():
    'Uninstall all packages'
    if _is_root == False:
        return _root_required()
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
    out = _communicate(['pkgutil', '--file-info', path])
    for line in out:
        line = line.strip()
        if line.startswith('pkgid: '):
            print line[len('pkgid: '):]

def verify_package(pkg):
    'Verify package sanity'
    pkg = normalize(pkg)
    call(['pkgutil', '--verify', pkg], stderr=PIPE)

def verify_all_packages():
    'Verify all packages sanity'
    for pkg in get_packages():
        verify_package(pkg)

def fix_package(pkg):
    'Try to fix permissions and groups of package'
    if _is_root() == False:
        return _root_required()
    pkg = normalize(pkg)
    call(['pkgutil', '--repair', pkg], stderr=PIPE)

def version_compare(v1, v2):
    'Compare software version'
    from distutils.version import LooseVersion
    # remove the release
    ver_rel_re = re.compile('([^-]+)(?:-(\d+)$)?')
    v1, r1 = ver_rel_re.match(v1).groups()
    v2, r2 = ver_rel_re.match(v2).groups()

    v_cmp = cmp(LooseVersion(v1), LooseVersion(v2))
    if v_cmp == 0:
        # if the same version then compare the release
        if r1 is None:
            r1 = 0
        if r2 is None:
            r2 = 0
        return cmp(int(r1), int(r2))
    else:
        return v_cmp


def _retrieve(url):
    'Retrieve content from URL'
    UA = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10'
    request = Request(url)
    request.add_header('Accept-Encoding', 'gzip')
    request.add_header('User-Agent', UA)
    response = urlopen(request)
    if response.headers.get('content-encoding', '') == 'gzip':
        buf = StringIO(response.read())
        gz = GzipFile(fileobj=buf)
        content = gz.read()
    else:
        content = response.read()
    response.close()
    return content

def _retrieve_simple(url):
    'Retrieve content from URL'
    data = urlopen(url)
    content = data.read()
    return content

def get_available_packages(rudix_version=VERSION, limit=1000):
    '''Get available packages.
    Return a list (ordered by release time, lastest first) of all packages available for installation.
    Filters: rudix_version and limit.
    '''
    url = 'http://code.google.com/p/%s/downloads/list?q=Rudix:%d&num=%d&can=2' % (RUDIX, rudix_version, limit)
    content = _retrieve(url)
    packages = re.findall('%s.googlecode.com/files/(.*)(\.dmg|\.pkg)"' % RUDIX, content)
    return packages

def print_available_packages():
    'Print all packages available for installation'
    versions = get_available_packages()
    for version in versions:
        name = version[0]
        print name

def print_aliases():
    'Print all aliases'
    aliases = ALIASES.keys()
    aliases.sort()
    for alias in aliases:
        print "alias '%s' for package '%s'" % (alias, ALIASES[alias])

def get_versions_for_package(pkg, rudix_version=VERSION, limit=10):
    'Get a list of available versions for package'
    pkg = denormalize(pkg)
    url = 'http://code.google.com/p/%s/downloads/list?q=Filename:%s+Rudix:%d&num=%d&can=2' % (RUDIX, pkg, rudix_version, limit)
    content = _retrieve(url)
    urls = re.findall('(%s.googlecode.com/files/(%s-([\w.]+(?:-\d+)?(?:.i386)?)(\.dmg|\.pkg)))' % (RUDIX, pkg), content)
    versions = sorted(list(set(urls)),
                      cmp=lambda x, y: version_compare(x[2], y[2]))
    if len(versions) == 0:
        return []
    else:
        return versions

def get_latest_version_of_package(pkg):
    'Get the latest version of package'
    versions = get_versions_for_package(pkg)
    if versions:
        return versions[-1]
    else:
        return []

def print_versions_for_package(pkg):
    'Print all versions available for package'
    versions = get_versions_for_package(pkg)
    for version in versions:
        name = version[1]
        if name.endswith('.dmg'):
            name = name[:name.index('.dmg')]
        if name.endswith('.pkg'):
            name = name[:name.index('.pkg')]
        print name

def net_install_package(pkg, net_info):
    'Support function for net_install_command'
    net_url, net_filename, net_version, net_extension = net_info
    print 'Downloading', net_url
    tempf, file_path = tempfile.mkstemp(suffix=net_extension)
    try:
        call(['curl', '-f', '-o', file_path, '-C', '-', '-L', '-#', net_url])
        if net_extension == '.dmg':
            print 'Mounting downloaded image file', file_path
            out = _communicate(['hdiutil', 'attach', '-noautoopen', file_path])
            for l in out:
                if 'Apple_partition_scheme' in l:
                    disk_path = l.split()[0]
                if 'Apple_HFS' in l:
                    volume_path = l.split()[2]
            filepath = os.path.join(volume_path, denormalize(pkg) + '.pkg')
        if net_extension == '.pkg':
            filepath = file_path
        if os.path.exists(filepath):
            install_package(filepath)
        if net_extension == '.dmg':
            print 'Unmounting image', volume_path
            call(['hdiutil', 'detach', disk_path], stdout=PIPE, stderr=PIPE)
    finally:
        os.close(tempf)

def net_install_command(pkg):
    'Install package from the Internet if the package was not installed or is older than the internet version'
    net_info = get_latest_version_of_package(pkg)
    version, install_date = get_package_info(pkg)
    if net_info == []:
        print "Package '%s' not found online" % pkg
        return
    if version is not None and version_compare(version, net_info[2]) >= 0:
        print 'Latest version of package %s(%s) already installed' % (pkg, version)
        return
    if _is_root():
        net_install_package(pkg, net_info)
        print 'All done'
    else:
        _root_required()

def update_all_packages():
    'Try to update the current base of packages'
    to_update = []
    # take each package, go to the internet and see if there is a newer version
    for pkg in get_packages():
        net_info = get_latest_version_of_package(pkg)
        version, install_date = get_package_info(pkg)
        if net_info == [] or version_compare(version, net_info[2]) >= 0:
            continue
        print '{0:25} {1:10} will be updated to version {2}'.format(denormalize(pkg), version, net_info[2])
        to_update.append((pkg, net_info))
    if len(to_update) == 0:
        print 'All packages are up to date'
        return
    # if there is packages to update you need to be root
    if _is_root():
        for pkg, net_info in to_update:
            net_install_package(pkg, net_info)
        print 'All done'
    else:
        _root_required()

def normalize(pkg):
    'Transform package in full pkg-id (with PREFIX)'
    if ALIASES.has_key(pkg):
        pkg = ALIASES[pkg]
    if not pkg.startswith(PREFIX):
        pkg = PREFIX + pkg
    return pkg

def denormalize(pkg):
    'Transform package in name without PREFIX'
    if pkg.startswith(PREFIX):
        pkg = pkg[len(PREFIX):]
    return pkg

def repl():
    'The interactive mode (read-eval-print-loop)'
    rudix_version()
    while True:
        print ']',
        try:
            line = raw_input().strip()
        except KeyboardInterrupt:
            print
            return 0
        except EOFError:
            print
            return 0
        if not line:
            continue
        if line in ['quit', 'exit', 'end', 'bye', 'halt']:
            break
        argv = [None] + line.split() # fake ARGV
        main(argv)

def process(args):
    'Process arguments and execute some action'
    try:
        opts, args = getopt.getopt(args, "aAhI:lL:i:r:Rs:S:vV:Kf:n:uz")
    except getopt.error, msg:
        print >> sys.stderr, '%s: %s'%(PROGRAM_NAME, msg)
        print >> sys.stderr, '\t for help use -h or help'
        return 2
    # option processing
    for option, value in opts:
        if option == '-h':
            usage()
            return 0
        if option == '-v':
            rudix_version()
            return 0
        if option == '-a':
            print_available_packages()
        if option == '-A':
            print_aliases()
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
        if option == '-s':
            print_versions_for_package(normalize(value))
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
        if option == '-z':
            repl()
    if args:
        try:
            opt = NAME_OPTS[args[0]]
        except KeyError, e:
            print >> sys.stderr, "%s: unknown command %s"%(PROGRAM_NAME, e)
            print >> sys.stderr, '\t for help use -h or help'
            return 2
        args[0] = opt
        return process(args)

def main(argv=None):
    if argv is None:
        argv = sys.argv
    if len(argv) == 1:
        list_all_packages()
        return 0
    return process(argv[1:])

if __name__ == "__main__":
    sys.exit(main())
