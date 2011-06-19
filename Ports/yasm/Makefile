BuildRequires += /usr/local/lib/libintl.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://www.tortall.net/projects/yasm/
License=	BSD
Description=	Complete rewrite of the NASM assembler
Title=		Yasm
Name=		yasm
Version=	1.1.0
Revision=	2
URL=		http://www.tortall.net/projects/yasm/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(PortDir)/README
LicenseFile=	$(BuildDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

define install_post_hook
install -m 644 $(BuildDir)/{GNU*,*.txt} $(InstallDir)/$(DocDir)/yasm/
endef
