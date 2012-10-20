include ../../Library/Python.mk

Title=		SCons
Name=		scons
Version=	2.1.0
Revision=	1
URL=		http://downloads.sourceforge.net/scons
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/scons --version
endef
