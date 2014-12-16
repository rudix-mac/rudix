include ../../Library/Python.mk

Title=		SCons
Name=		scons
Version=	2.3.1
Revision=	0
Site=		http://www.scons.org
URL=		http://downloads.sourceforge.net/scons
Source=		$(Name)-$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/scons --version | grep $(Version)
endef
