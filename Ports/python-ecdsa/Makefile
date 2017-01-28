include ../../Library/Python.mk

Title=		Python ECDSA
Name=		python-ecdsa
Version=	0.13
Site=		https://github.com/warner/python-ecdsa
Source=		https://pypi.python.org/packages/source/e/ecdsa/ecdsa-$(Version).tar.gz
License=        MIT

UncompressedName=ecdsa-$(Version)

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(Python) -c 'import ecdsa'
endef
