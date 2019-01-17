BuildRequires += $(LibDir)/libintl.la	# static-gettext

include ../../Library/GNU.mk

Title=		GNU Grep
Name=		grep
Version=	2.28
Site=		http://www.gnu.org/software/grep/
Source=		http://ftp.gnu.org/gnu/grep//$(Name)-$(Version).tar.xz
License=	GPL

GnuConfigureExtra += --program-prefix=gnu

define after_install_hook
./links.sh $(InstallDir)$(BinDir)
./links.sh $(InstallDir)$(Prefix)/share/man/man1
cd $(InstallDir)$(Prefix)/share/info ; ln -sf grep.info gnugrep.info
endef

define test_hook
$(BinDir)/grep --version | grep $(Version)
endef
