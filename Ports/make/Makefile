ifeq ($(RUDIX_ENABLE_NLS),yes)
BuildRequires += /usr/local/lib/libintl.la
endif

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Make is a tool which controls the generation of executables and other non-source files of a program
Site=		http://www.gnu.org/software/make/
License=	GPL
Title=		GNU Make $(Version)
Name=		make
Version=	3.82
Revision=	1
URL=		http://ftp.gnu.org/gnu/make/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
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
