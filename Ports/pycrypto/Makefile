include ../../Library/Python.mk

Title=		PyCrypto
Name=		pycrypto
Version=	2.6
Revision=	1
URL=		http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/COPYRIGHT

define test_inner_hook
$(Python) -c 'import Crypto'
endef
