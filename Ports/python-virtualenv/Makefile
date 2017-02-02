include ../../Library/Python.mk

Title=		Python virtualenv
Name=		python-virtualenv
Version=	15.0.0
Site=		https://pypi.python.org/pypi/virtualenv
Source=		https://pypi.python.org/packages/source/v/virtualenv/virtualenv-$(Version).tar.gz
License=	MIT

UncompressedName=virtualenv-$(Version)

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_hook
$(BinDir)/virtualenv --version | grep $(Version)
endef
