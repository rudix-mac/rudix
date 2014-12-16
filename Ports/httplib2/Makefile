include ../../Library/Python.mk

Title=		Python httplib2
Name=		httplib2
Version=	0.7.7
Revision=	0
Site=		http://code.google.com/p/httplib2/
URL=		http://pypi.python.org/packages/source/h/httplib2/
Source=		$(Name)-$(Version).tar.gz
License=	MIT

LicenseFile=	$(SourceDir)/PKG-INFO

define test_inner_hook
$(Python) -c 'import httplib2'
endef
