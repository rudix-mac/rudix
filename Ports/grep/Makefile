BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(BinDir)/xz

include ../../Library/GNU.mk

Title=		GNU Grep
Name=		grep
Version=	2.12
Revision=	0
URL=		http://ftp.gnu.org/gnu/grep/
Source=		$(Name)-$(Version).tar.xz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
endif

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
./links.sh $(InstallDir)$(BinDir)
./links.sh $(InstallDir)$(Prefix)/share/man/man1
cd $(InstallDir)$(Prefix)/share/info ; ln -sf grep.info gnugrep.info
endef
