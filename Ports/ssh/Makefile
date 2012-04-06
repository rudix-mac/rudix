BuildRequires += /Library/Python/2.7/site-packages/Crypto/

include ../../Library/Python.mk

Title=		ssh (Python module)
Name=		ssh
Version=	1.7.13
Revision=	0
URL=		http://pypi.python.org/packages/source/s/ssh/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
cd $(BuildDir) ; python test.py
endef

define final_inner_hook
python -c 'import ssh'
endef
