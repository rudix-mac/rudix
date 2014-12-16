include ../../Library/Python.mk

Title=		Python Twitter Tools
Name=		twitter
Version=	1.10.0
Revision=	0
Site=		http://mike.verdone.ca/twitter/
URL=		http://pypi.python.org/packages/source/t/twitter/
Source=		$(Name)-$(Version).tar.gz
License=	MIT

LicenseFile=	$(SourceDir)/PKG-INFO

define test_inner_hook
stat $(BinDir)/twitter
$(Python) -c 'import twitter'
endef
