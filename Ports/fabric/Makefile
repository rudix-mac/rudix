Requires += org.rudix.pkg.pycrypto,pycrypto,pycryptoinstall.pkg
Requires += org.rudix.pkg.paramiko,paramiko,paramikoinstall.pkg

include ../../Library/Python.mk

Title=		Fabric
Name=		fabric
Version=	1.6.1
Revision=	0
URL=		http://pypi.python.org/packages/source/F/Fabric/
Source=		Fabric-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/fab --version
$(Python) -c 'from fabric.api import run ; run("uptime")'
endef
