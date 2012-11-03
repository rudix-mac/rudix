include ../../Library/Python.mk

Title=		lxml
Name=		lxml
Version=	2.3.3
Revision=	1
URL=		http://pypi.python.org/packages/source/l/lxml/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSES.txt

define test_inner_hook
$(Python) -c 'import lxml'
endef
