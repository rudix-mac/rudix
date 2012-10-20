# Requires PyCrypto and ssh.

include ../../Library/Python.mk

Title=		Fabric
Name=		fabric
Version=	1.4.2
Revision=	0
URL=		http://pypi.python.org/packages/source/F/Fabric/
Source=		Fabric-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/fab --version
$(Python) -c 'from fabric.api import run ; run("uptime")'
endef
