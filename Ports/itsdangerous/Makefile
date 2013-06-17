include ../../Library/Python.mk

Title=		ItIsDangerous (Python Module)
Name=		itsdangerous
Version=	0.21
Revision=	0
URL=		https://pypi.python.org/packages/source/i/itsdangerous
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/PKG-INFO

define test_inner_hook
$(Python) -c 'import itsdangerous'
endef
