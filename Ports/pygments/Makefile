include ../../Library/Python.mk

Title=		Pygments
Name=		pygments
Version=	1.6
Site=		http://pygments.org
Source=		https://pypi.python.org/packages/source/P/Pygments//Pygments-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/pygmentize -V
endef
