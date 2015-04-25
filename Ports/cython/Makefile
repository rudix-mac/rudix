include ../../Library/Python.mk

Title=		Cython
Name=		cython
Version=	0.21.1
Revision=	0
Site=		http://www.cython.org/
Source=		http://www.cython.org/release/Cython-$(Version).tar.gz
License=	Apache License

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/cython --version 2>&1 | grep $(Version)
endef
