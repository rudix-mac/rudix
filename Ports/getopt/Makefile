BuildRequires += $(LibDir)/libintl.la # gettext

include ../../Library/Unix.mk

Title=		Getopt
Name=		getopt
Version=	1.1.6
Site=		http://software.frodo.looijaard.name/getopt/
Source=		http://frodo.looijaard.name/system/files/software/getopt/$(Name)-$(Version).tar.gz
License=	GPL

LdFlags += -framework CoreFoundation -liconv -lintl
MakeExtra += LIBCGETOPT=0
MakeInstallExtra += mandir=$(InstallDir)$(ManDir)

define test_hook
$(BinDir)/getopt --version
endef
