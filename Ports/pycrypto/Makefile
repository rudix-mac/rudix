include ../../Library/Python.mk

Title=		PyCrypto
Name=		pycrypto
Version=	2.6.1
Site=		https://www.dlitz.net/software/pycrypto/
Source=		http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto//$(Name)-$(Version).tar.gz
License=	Public Domain
LicenseFile=	$(SourceDir)/COPYRIGHT

define test_inner_hook
$(Python) -c 'import Crypto'
endef
