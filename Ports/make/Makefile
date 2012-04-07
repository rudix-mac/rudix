include ../../Library/GNU.mk

Title=		GNU Make
Name=		make
Version=	3.82
Revision=	2
URL=		http://ftp.gnu.org/gnu/make/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf gnumake make
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf gnumake.1 make.1
endef
