include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Librsync
Name=		librsync
Version=	0.9.7
Revision=	11
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz


ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
else
GnuConfigureExtra += --enable-static --enable-shared
endif

MakeExtra += LDFLAGS="$(LdFlags)"
