BuildRequires += $(LibDir)/libintl.la	# gettext

include ../../Library/GNU.mk

Title=		GNU Grep
Name=		grep
Version=	3.3
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/grep/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --program-prefix=gnu

define after_install_hook
./links.sh $(InstallDir)$(BinDir)
./links.sh $(InstallDir)$(Prefix)/share/man/man1
cd $(InstallDir)$(Prefix)/share/info ; ln -sf grep.info gnugrep.info
endef

define test_hook
$(BinDir)/grep --version | grep $(Version)
endef
