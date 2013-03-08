include ../../Library/Python.mk

Title=		Pygments
Name=		pygments
Version=	1.6
Revision=	0
URL=		https://pypi.python.org/packages/source/P/Pygments/
Source=		Pygments-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/pygmentize -V
endef
