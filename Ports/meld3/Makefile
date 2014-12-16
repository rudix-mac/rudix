include ../../Library/Python.mk

Title=		meld3 (Python Module)
Name=		meld3
Version=	0.6.10
Revision=	0
Site=		http://www.plope.com/software/meld3/
URL=		http://pypi.python.org/packages/source/m/meld3/
Source=		$(Name)-$(Version).tar.gz
License=	ZPL

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYRIGHT.txt

define test_inner_hook
$(Python) -c 'import meld3'
endef
