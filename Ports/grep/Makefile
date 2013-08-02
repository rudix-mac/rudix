BuildRequires += $(LibDir)/libintl.la	# static-gettext
BuildRequires += $(BinDir)/xz 		# xz

include ../../Library/GNU.mk

Title=		GNU Grep
Name=		grep
Version=	2.14
Revision=	0
URL=		http://ftp.gnu.org/gnu/grep/
Source=		$(Name)-$(Version).tar.xz

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
./links.sh $(InstallDir)$(BinDir)
./links.sh $(InstallDir)$(Prefix)/share/man/man1
cd $(InstallDir)$(Prefix)/share/info ; ln -sf grep.info gnugrep.info
endef

define test_inner_hook
$(BinDir)/grep --version
endef
