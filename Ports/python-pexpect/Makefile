include ../../Library/Python.mk

Title=		Python Pexpect
Name=		python-pexpect
Version=	3.1
Site=           http://pexpect.readthedocs.org/en/latest/
Source=		https://pypi.python.org/packages/source/p/pexpect//pexpect-$(Version).tar.gz
License=        ISC

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=pexpect-$(Version)

define test_inner_hook
$(Python) -c 'import pexpect'
endef
