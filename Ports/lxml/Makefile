include ../../Library/Python.mk

Title=		XML and HTML with Python
Name=		lxml
Version=	3.2.3
Revision=	0
URL=		http://pypi.python.org/packages/source/l/lxml/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSES.txt

define test_inner_hook
$(Python) -c 'import lxml'
endef
