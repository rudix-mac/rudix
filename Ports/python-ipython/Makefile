include ../../Library/Python.mk

Title=		IPython
Name=		python-ipython
Version=	2.1.0
Revision=	0
Site=           http://ipython.org
URL=		http://archive.ipython.org/release/$(Version)
Source=		ipython-$(Version).tar.gz
License=        BSD

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/COPYING.rst

UncompressedName=ipython-$(Version)

define test_inner_hook
$(BinDir)/ipython --version | grep $(Version)
endef
