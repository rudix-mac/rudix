# Package Maintainer: Qichang Liang
# email: kcleung@cs.otago.ac.nz

include ../../Library/Unix.mk

Summary=	Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors
Title=		Tree
Name=		tree
Version=	1.8.0
Site=		http://mama.indstate.edu/users/ice/tree/
Source=		http://mama.indstate.edu/users/ice/tree/src/$(Name)-$(Version).tgz
License=	GPLv2

# http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz

LicenseFile=	$(SourceDir)/LICENSE

MakeInstallExtra += prefix=$(DestDir)$(Prefix)
MakeInstallExtra += MANDIR=$(DestDir)$(ManDir)

PatchLevel=-p1

define after_retrieve_hook
cp tree-1.8.0.tgz tree-1.8.0.tar.gz
endef

define check_hook
$(BuildDir)/tree
endef

define test_hook
$(BinDir)/tree --version | grep v$(Version)
endef
