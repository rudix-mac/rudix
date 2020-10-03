include ../../Library/GNU.mk

Title=		GNU Make
Name=		make
Version=	4.3
Site=		https://www.gnu.org/software/make/
Source=		https://ftp.gnu.org/gnu/make/$(Name)-$(Version).tar.gz
License=	GPLv3

BuildSuggests += $(LibDir)/libintl.la # gettext
GnuConfigureExtra += --program-prefix=gnu

define after_install_hook
cd $(InstallDir)$(BinDir) && ln -sf gnumake make
cd $(InstallDir)$(ManDir)/man1 && ln -sf gnumake.1 make.1
endef

define test_hook
$(BinDir)/make --version | grep $(Version)
endef
