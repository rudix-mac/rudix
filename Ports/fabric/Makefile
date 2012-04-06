# Requires PyCrypto and ssh.

include ../../Library/Python.mk

Title=		Fabric
Name=		fabric
Version=	1.4.1
Revision=	0
URL=		http://pypi.python.org/packages/source/F/Fabric/
Source=		Fabric-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

define final_inner_hook
/usr/local/bin/fab
python -c 'from fabric.api import run ; run("uptime")'
endef
