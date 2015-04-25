include ../../Library/Python.mk

Title=		XML and HTML with Python
Name=		lxml
Version=	3.4.1
Revision=	0
Site=		http://lxml.de/
Source=		http://pypi.python.org/packages/source/l/lxml//$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSES.txt

define test_inner_hook
$(Python) -c 'import lxml'
endef
