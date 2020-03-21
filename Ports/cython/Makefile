include ../../Library/Python.mk

Title=		Cython
Name=		cython
Version=	0.29.15
Site=		http://www.cython.org/
Source=		http://www.cython.org/release/Cython-$(Version).tar.gz
Source=		https://files.pythonhosted.org/packages/d9/82/d01e767abb9c4a5c07a6a1e6f4d5a8dfce7369318d31f48a52374094372e/Cython-$(Version).tar.gz
License=	Apache License

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_hook
$(Python) -c 'import cython'
$(BinDir)/cython --version 2>&1 | grep $(Version)
endef
