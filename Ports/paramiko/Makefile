BuildRequires += $(PythonSitePackages)/Crypto # pycrypto
BuildRequires += $(PythonSitePackages)/ecdsa # python-ecdsa

Requires += org.rudix.pkg.pycrypto,pycrypto,pycryptoinstall.pkg
Requires += org.rudix.pkg.python-ecdsa,python-ecdsa,python-ecdsainstall.pkg

include ../../Library/Python.mk

Title=		Paramiko
Name=		paramiko
Version=	1.15.2
Site=		http://www.lag.net/paramiko/
Site=		http://www.lag.net/paramiko/
Source=		https://pypi.python.org/packages/source/p/paramiko/$(Name)-$(Version).tar.gz
License=	LGPL

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
cd $(BuildDir) ; $(Python) test.py
endef

define test_inner_hook
$(Python) -c 'import paramiko'
endef
