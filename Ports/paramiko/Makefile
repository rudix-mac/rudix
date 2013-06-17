BuildRequires += $(DocDir)/pycrypto # pycrypto
Requires += org.rudix.pkg.pycrypto,pycrypto,pycryptoinstall.pkg

include ../../Library/Python.mk

Title=		Paramiko (Python SSH module)
Name=		paramiko
Version=	1.10.1
Revision=	0
URL=		http://www.lag.net/paramiko/download/
URL=		https://pypi.python.org/packages/source/p/paramiko
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
cd $(BuildDir) ; $(Python) test.py
endef

define test_inner_hook
$(Python) -c 'import paramiko'
endef
