Requires += org.rudix.pkg.pycrypto,pycrypto,pycryptoinstall.pkg
Requires += org.rudix.pkg.python-ecdsa,python-ecdsa,python-ecdsainstall.pkg
Requires += org.rudix.pkg.paramiko,paramiko,paramikoinstall.pkg

include ../../Library/Python.mk

Title=		Fabric
Name=		fabric
Version=	1.10.2
Site=		http://fabfile.org/
Source=		https://pypi.python.org/packages/source/F/Fabric/Fabric-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/fab --version
$(Python) -c 'from fabric.api import run ; run("uptime")'
endef
