BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/Unix.mk

Title=		Getopt
Name=		getopt
Version=	1.1.5
Revision=	0
URL=		http://software.frodo.looijaard.name/getopt/files
Source=		$(Name)-$(Version).tar.gz

LdFlags += -framework CoreFoundation -liconv -lintl
MakeExtra += LIBCGETOPT=0
MakeInstallExtra += mandir=$(InstallDir)$(ManDir)

define test_inner_hook
$(BinDir)/getopt --version
endef
