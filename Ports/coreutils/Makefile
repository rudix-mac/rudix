BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		GNU Core Utilities
Name=		coreutils
Version=	8.25
Revision=	0
Site=		http://www.gnu.org/software/coreutils/
Source=		http://ftp.gnu.org/gnu/coreutils//$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += jm_cv_func_svid_putenv=yes
GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
$(PortDir)/mklinks.sh $(InstallDir)$(BinDir)
$(PortDir)/mklinks.sh $(InstallDir)$(Prefix)/share/man/man1
endef

define test_inner_hook
$(BinDir)/gnuyes --version | grep $(Version)
endef
