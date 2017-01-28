include ../../Library/Python.mk

Title=		Python subprocess32
Name=		python-subprocess32
Version=	3.2.6
Site=		https://code.google.com/p/python-subprocess32/
Source=		https://pypi.python.org/packages/source/s/subprocess32/subprocess32-$(Version).tar.gz
License=	PSF

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=subprocess32-$(Version)

define test_inner_hook
$(Python) -c 'import subprocess32'
endef
