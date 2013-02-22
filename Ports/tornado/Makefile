include ../../Library/Python.mk

Title=		Tornado
Name=		tornado
Version=	2.4.1
Revision=	0
URL=		https://github.com/downloads/facebook/tornado
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	LICENSE-2.0

define test_inner_hook
$(Python) -c 'import tornado'
endef
