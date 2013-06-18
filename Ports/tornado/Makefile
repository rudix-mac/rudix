include ../../Library/Python.mk

Title=		Tornado
Name=		tornado
Version=	3.1
Revision=	0
URL=		https://pypi.python.org/packages/source/t/tornado
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	LICENSE-2.0

define test_inner_hook
$(Python) -c 'import tornado'
endef
