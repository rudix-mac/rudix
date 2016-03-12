include ../../Library/Python.mk

Title=		Python virtualenv
Name=		python-virtualenv
Version=	15.0.0
Revision=	0
Site=		https://pypi.python.org/pypi/virtualenv
Source=		https://pypi.python.org/packages/source/v/virtualenv/virtualenv-$(Version).tar.gz
Checksum=	a51d035c4a5bdf0dda28a66d823b619d29c0d5e4
License=	MIT

UncompressedName=virtualenv-$(Version)

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/virtualenv --version | grep $(Version)
endef
