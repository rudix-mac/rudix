include ../../Library/Python.mk

Title=		Cython
Name=		cython
Version=	0.27.3
Site=		http://www.cython.org/
Source=		http://www.cython.org/release/Cython-$(Version).tar.gz
Source=		https://pypi.python.org/packages/ee/2a/c4d2cdd19c84c32d978d18e9355d1ba9982a383de87d0fcb5928553d37f4/Cython-$(Version).tar.gz
License=	Apache License

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_hook
$(Python) -c 'import cython'
$(BinDir)/cython --version 2>&1 | grep $(Version)
endef
