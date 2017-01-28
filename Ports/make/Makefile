BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		GNU Make
Name=		make
Version=	4.2
Site=		http://www.gnu.org/software/make/
Source=		http://ftp.gnu.org/gnu/make/$(Name)-$(Version).tar.bz2
License=	GPLv3

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
cd $(InstallDir)$(BinDir) && ln -sf gnumake make
cd $(InstallDir)$(Prefix)/share/man/man1 && ln -sf gnumake.1 make.1
endef

define test_inner_hook
$(BinDir)/make --version | grep $(Version)
endef
