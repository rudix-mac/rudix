# Package Maintainer: Qichang Liang
# email: kcleung@cs.otago.ac.nz

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		tree
Name=		tree
Version=	1.6.0
Revision=	0
URL=		http://mama.indstate.edu/users/ice/tree/src/
Source=		$(Name)-$(Version).tgz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/usr/local
MakeInstallExtra += MANDIR=$(PortDir)/$(InstallDir)/usr/local/share/man

define test_inner_hook
$(BuildDir)/tree
$(BinDir)/tree
endef
