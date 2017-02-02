include ../../Library/Python.mk

Title=		simplejson
Name=		simplejson
Version=	3.3.0
Site=		http://pypi.python.org/pypi/simplejson
Source=		http://pypi.python.org/packages/source/s/simplejson/$(Name)-$(Version).tar.gz
License=	BSD like

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_hook
$(Python) -c 'import simplejson'
endef
