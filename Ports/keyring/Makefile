include ../../Library/Python.mk

Title=		Keyring (Python Module)
Name=		keyring
Version=	1.6.1
Revision=	0
Site=		http://pypi.python.org/pypi/keyring
URL=		http://pypi.python.org/packages/source/k/keyring/
Source=		$(Name)-$(Version).zip
License=	PSF

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/PKG-INFO

define test_inner_hook
$(Python) -c 'import keyring'
endef
