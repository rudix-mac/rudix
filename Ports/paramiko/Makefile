BuildRequires += $(DocDir)/pycrypto # pycrypto

include ../../Library/Python.mk

Title=		Paramiko (Python SSH module)
Name=		paramiko
Version=	1.7.7.1
Revision=	0
URL=		http://www.lag.net/paramiko/download/
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
cd $(BuildDir) ; $(Python) test.py
endef

define test_inner_hook
$(Python) -c 'import paramiko'
endef
