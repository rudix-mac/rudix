# Package Maintainer: Qichang Liang
# email: kcleung@cs.otago.ac.nz

include ../../Library/Unix.mk

Summary=	Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors
Title=		Tree
Name=		tree
Version=	1.7.0
Revision=	0
Site=		http://mama.indstate.edu/users/ice/tree/
Source=		http://mama.indstate.edu/users/ice/tree/src//$(Name)-$(Version).tgz
License=	GPLv2

LicenseFile=	$(SourceDir)/LICENSE

MakeInstallExtra += prefix=$(DestDir)$(Prefix)
MakeInstallExtra += MANDIR=$(DestDir)$(ManDir)

define check_inner_hook
$(BuildDir)/tree
endef

define test_inner_hook
$(BinDir)/tree --version | grep v$(Version)
endef
