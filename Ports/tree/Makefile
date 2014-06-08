# Package Maintainer: Qichang Liang
# email: kcleung@cs.otago.ac.nz

include ../../Library/Unix.mk

Title=		tree
Name=		tree
Version=	1.6.0
Revision=	1
Site=		http://mama.indstate.edu/users/ice/tree/
URL=		http://mama.indstate.edu/users/ice/tree/src/
Source=		$(Name)-$(Version).tgz
License=	GPL Version 2

LicenseFile=	$(SourceDir)/LICENSE

MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/usr/local
MakeInstallExtra += MANDIR=$(PortDir)/$(InstallDir)/usr/local/share/man

define test_inner_hook
$(BuildDir)/tree
$(BinDir)/tree
endef
