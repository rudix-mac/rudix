include ../../Library/Python.mk

Title=		Python virtualenv
Name=		python-virtualenv
Version=	12.1.1
Revision=	0
Site=		http://www.virtualenv.org # https://pypi.python.org/pypi/virtualenv
Source=		http://pypi.python.org/packages/source/v/virtualenv//virtualenv-$(Version).tar.gz
Checksum=	d9376bd77160c7c0f1b2a37212fdbc1c75d0dada
License=	MIT

UncompressedName=virtualenv-$(Version)

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/virtualenv --version | grep $(Version)
endef
