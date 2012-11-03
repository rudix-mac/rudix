BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		GNU Make
Name=		make
Version=	3.82
Revision=	3
URL=		http://ftp.gnu.org/gnu/make/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf gnumake make
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf gnumake.1 make.1
endef

define test_inner_hook
$(BinDir)/make --version
endef
