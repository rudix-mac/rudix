include ../../Library/Python.mk

Title=		Python httplib2
Name=		httplib2
Version=	0.9.2
Site=		https://github.com/jcgregorio/httplib2
Source=		https://github.com/jcgregorio/httplib2/archive/$(Version).tar.gz
License=	MIT

LicenseFile=	$(SourceDir)/PKG-INFO

define test_hook
$(Python) -c 'import httplib2'
endef
