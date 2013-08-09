BuildRequires += $(LibDir)/libgmp.la # static-gmp

include ../../Library/Python.mk

Title=		GMPY (GMP Python Module)
Name=		gmpy
Version=	1.16
Revision=	0
URL=		http://gmpy.googlecode.com/files/
Source=		$(Name)-$(Version).zip

LicenseFile=	$(SourceDir)/lgpl-2.1.txt

define test_inner_hook
cd $(SourceDir) ; $(Python) test/gmpy_test.py
$(Python) -c 'import gmpy ; print gmpy.pi(8)'
endef
