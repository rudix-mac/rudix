include ../../Library/Python.mk

Title=		meld3
Name=		meld3
Version=	0.6.8
Revision=	1
URL=		http://pypi.python.org/packages/source/m/meld3/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYRIGHT.txt

define test_inner_hook
python -c 'import meld3'
endef
