include ../../Library/Python.mk

Title=		PyCrypto
Name=		pycrypto
Version=	2.6
Revision=	0
URL=		http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

define final_inner_hook
python -c 'import Crypto'
endef
