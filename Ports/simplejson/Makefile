include ../../Library/Python.mk

Title=		simplejson
Name=		simplejson
Version=	2.5.2
Revision=	0
URL=		http://pypi.python.org/packages/source/s/simplejson
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

define final_inner_hook
$(Python) -c 'import simplejson'
endef
