BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/Unix.mk

Title=		Getopt
Name=		getopt
Version=	1.1.5
Revision=	0
Site=		http://software.frodo.looijaard.name/getopt/
Source=		http://software.frodo.looijaard.name/getopt/files/$(Name)-$(Version).tar.gz
License=	GPL

LdFlags += -framework CoreFoundation -liconv -lintl
MakeExtra += LIBCGETOPT=0
MakeInstallExtra += mandir=$(InstallDir)$(ManDir)

define test_inner_hook
$(BinDir)/getopt --version
endef
