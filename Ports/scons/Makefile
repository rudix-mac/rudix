include ../../Library/Python.mk

Title=		SCons
Name=		scons
Version=	2.1.0
Revision=	1
URL=		http://downloads.sourceforge.net/scons
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define final_inner_hook
$(Bindir)/scons --version
endef
