include ../../Library/Python.mk

Title=		Tornado
Name=		tornado
Version=	3.1
Revision=	0
Site=		http://www.tornadoweb.org/
Source=		https://pypi.python.org/packages/source/t/tornado/$(Name)-$(Version).tar.gz
License=	Apache

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	LICENSE-2.0

define test_inner_hook
$(Python) -c 'import tornado'
endef
