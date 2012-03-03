include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		ELinks
Name=		elinks
Version=	0.13
Revision=	0
URL=		http://elinks.or.cz/download/
Source=		$(Name)-current-$(Version).tar.bz2

UncompressedName = elinks-0.13-20120302

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
#perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

define make
make
endef