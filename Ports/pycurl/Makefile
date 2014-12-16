include ../../Library/Python.mk

Title=		PycURL
Name=		pycurl
Version=	7.19.0
Revision=	2
Site=		http://pycurl.sourceforge.net/
URL=		http://pycurl.sourceforge.net/download/
Source=		$(Name)-$(Version).tar.gz
License=	LGPL/MIT

define test_inner_hook
$(Python) -c 'import pycurl'
endef
