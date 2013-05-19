include ../../Library/Python.mk

Title=		PyTest
Name=		pytest
Version=	2.3.5
Revision=	0
URL=		https://pypi.python.org/packages/source/p/pytest
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import pytest'
endef
