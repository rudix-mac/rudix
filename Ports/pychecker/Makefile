include ../../Library/Python.mk

Title=		PyChecker
Name=		pychecker
Version=	0.8.19
Revision=	2
URL=		http://sourceforge.net/projects/pychecker/files/pychecker/$(Version)/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

define final_inner_hook
$(BinDir)/pychecker --version
endef
