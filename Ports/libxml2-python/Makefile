include ../../Library/Python.mk

Title=		libxml2-python
Name=		libxml2-python
Version=	2.6.21
Revision=	3
Site=		http://xmlsoft.org/python.html
Source=		ftp://xmlsoft.org/libxml2/python//$(Name)-$(Version).tar.gz
License=	MIT

LicenseFile=	$(SourceDir)/PKG-INFO

define test_inner_hook
$(Python) -c 'import libxml2'
$(Python) -c 'import libxslt'
endef
