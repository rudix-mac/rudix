BuildRequires += $(LibDir)/libintl.la	# gettext | static-gettext

include ../../Library/GNU.mk

Title=		GNU Core Utilities
Name=		coreutils
Version=	8.30
Site=		https://www.gnu.org/software/coreutils/
Source=		https://ftp.gnu.org/gnu/coreutils/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += jm_cv_func_svid_putenv=yes
GnuConfigureExtra += --program-prefix=gnu

define after_install_hook
$(PortDir)/mklinks.sh $(InstallDir)$(BinDir)
$(PortDir)/mklinks.sh $(InstallDir)$(ManDir)/man1
endef

define test_hook
$(BinDir)/gnuyes --version | grep $(Version)
endef
