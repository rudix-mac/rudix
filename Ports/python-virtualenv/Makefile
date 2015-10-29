include ../../Library/Python.mk

Title=		Python virtualenv
Name=		python-virtualenv
Version=	13.1.2
Revision=	0
Site=		# https://pypi.python.org/pypi/virtualenv
Source=		https://pypi.python.org/packages/source/v/virtualenv/virtualenv-$(Version).tar.gz
Checksum=	766b12e9214751e547da267ffba79a84aaf7b3b0
License=	MIT

UncompressedName=virtualenv-$(Version)

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/virtualenv --version | grep $(Version)
endef
