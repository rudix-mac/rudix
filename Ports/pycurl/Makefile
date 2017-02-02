
include ../../Library/Python.mk

Title=		PycURL
Name=		pycurl
Version=	7.19.5.1
Site=		http://pycurl.sourceforge.net/
Source=		http://pycurl.sourceforge.net/download/$(Name)-$(Version).tar.gz
License=	LGPL/MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/COPYING-LGPL

#EnvExtra += PYCURL_SSL_LIBRARY=openssl
SetupExtra += --with-darwinssl

define check_post_hook
nm $(BuildDir)/build/*/pycurl.so | grep ssl
endef

define test_hook
$(Python) -c 'import pycurl'
endef
