include ../../Library/Python.mk

Title=		Python httplib2
Name=		httplib2
Version=	0.7.7
Site=		http://code.google.com/p/httplib2/
Source=		http://pypi.python.org/packages/source/h/httplib2//$(Name)-$(Version).tar.gz
License=	MIT

LicenseFile=	$(SourceDir)/PKG-INFO

define test_inner_hook
$(Python) -c 'import httplib2'
endef
