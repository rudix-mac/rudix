include ../../Library/Python.mk

Title=		Keyring (Python Module)
Name=		keyring
Version=	1.6.1
Site=		http://pypi.python.org/pypi/keyring
Source=		http://pypi.python.org/packages/source/k/keyring//$(Name)-$(Version).zip
License=	PSF

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/PKG-INFO

define test_inner_hook
$(Python) -c 'import keyring'
endef
