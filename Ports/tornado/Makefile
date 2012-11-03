include ../../Library/Python.mk

Title=		Tornado
Name=		tornado
Version=	2.3
Revision=	0
URL=		http://github.com/downloads/facebook/tornado/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE-2.0

define test_inner_hook
$(Python) -c 'import tornado'
endef
