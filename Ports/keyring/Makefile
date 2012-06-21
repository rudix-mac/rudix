include ../../Library/Python.mk

Title=		Keyring
Name=		keyring
Version=	0.9.2
Revision=	0
URL=		http://pypi.python.org/packages/source/k/keyring/
Source=		$(Name)-$(Version).zip

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/PKG-INFO

define final_inner_hook
$(Python) -c 'import keyring'
endef
