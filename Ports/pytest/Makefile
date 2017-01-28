include ../../Library/Python.mk

Title=		PyTest
Name=		pytest
Version=	2.3.5
Site=		http://pytest.org/
Source=		https://pypi.python.org/packages/source/p/pytest/$(Name)-$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import pytest'
endef
