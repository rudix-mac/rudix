BuildRequires += /Library/Python/2.7/site-packages/Crypto/

include ../../Library/Python.mk

Title=		Paramiko
Name=		paramiko
Version=	1.7.7.1
Revision=	0
URL=		http://www.lag.net/paramiko/download/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
cd $(BuildDir) ; python test.py
endef

define test_inner_hook
python -c 'import paramiko'
endef
