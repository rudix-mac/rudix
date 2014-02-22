include ../../Library/Python.mk

Title=		Python pip
Name=		pip
Version=	1.5.4
Revision=	0
Site=		https://github.com/pypa/pip
URL=		http://pypi.python.org/packages/source/p/pip/
Source=		$(Name)-$(Version).tar.gz
Checksum=	35ccb7430356186cf253615b70f8ee580610f734
License=	Python License

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/pip --version | grep $(Version)
endef
