BuildRequires += /usr/local/lib/libgmp.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNUs Ubiquitous Intelligent Language for Extension
Site=		http://www.gnu.org/software/guile/
License=	LGPL
Title=		Guile
Name=		guile
Version=	1.8.7
Revision=	2
URL=		http://ftp.gnu.org/gnu/guile/
Source=		$(Name)-$(Version).tar.gz

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif
#ifdef WITH_STATIC_GMP
## http://www.mail-archive.com/guile-devel@gnu.org/msg03413.html
#LDFLAGS=	-Wl,-read_only_relocs -Wl,suppress
#endif

define install_post_hook
install -m 644 $(SourceDir)/{GUILE-Version,HACKING} $(InstallDir)/$(DocDir)/$(Name)
endef
