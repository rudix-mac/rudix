include ../../Library/Python.mk

Title=		PyChecker
Name=		python-pychecker
Version=	0.8.19
Revision=	4
Site=		http://pychecker.sourceforge.net/
URL=		http://sourceforge.net/projects/pychecker/files/pychecker/$(Version)/
Source=		pychecker-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/COPYRIGHT

UncompressedName=pychecker-$(Version)

define test_inner_hook
$(BinDir)/pychecker --version | grep $(Version)
endef
