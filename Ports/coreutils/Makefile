# NOTE: install xz to compress the source
BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		GNU Core Utilities
Name=		coreutils
Version=	8.21
Revision=	0
URL=		http://ftp.gnu.org/gnu/coreutils/
Source=		$(Name)-$(Version).tar.xz

GnuConfigureExtra += jm_cv_func_svid_putenv=yes
GnuConfigureExtra +=  --program-prefix=gnu

define install_post_hook
$(PortDir)/mklinks.sh $(InstallDir)$(BinDir)
$(PortDir)/mklinks.sh $(InstallDir)$(Prefix)/share/man/man1
endef

define test_inner_hook
endef
