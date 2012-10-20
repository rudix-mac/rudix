BuildRequires += $(LibDir)/libgmp.la # static-gmp

include ../../Library/Python.mk

Title=		GMPY (Python Module)
Name=		gmpy
Version=	1.15
Revision=	0
URL=		http://gmpy.googlecode.com/files/
Source=		$(Name)-$(Version).zip

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/lgpl-2.1.txt

define test_inner_hook
endef

define test_inner_hook
cd $(SourceDir) ; $(Python) test/gmpy_test.py
endef
