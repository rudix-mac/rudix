BuildRequires += $(LibDir)/libgmp.la

include ../../Library/Config.mk

# Due GMP
RUDIX_UNIVERSAL=

include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNUs Ubiquitous Intelligent Language for Extension
Site=		http://www.gnu.org/software/guile/
License=	LGPL
Title=		Guile
Name=		guile
Version=	1.8.7
Revision=	3
URL=		http://ftp.gnu.org/gnu/guile/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

EnvExtra += 	LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra +=	LIBFFI_LIBS="-L/usr/local/lib -lffi"

#ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
#LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
#define prep_post_hook
#perl -p -i -e s/'intl '//g $(SourceDir)/configure
#endef
#endif

#ifdef WITH_STATIC_GMP
## http://www.mail-archive.com/guile-devel@gnu.org/msg03413.html
#LDFLAGS=	-Wl,-read_only_relocs -Wl,suppress
#endif

define install_post_hook
install -m 644 $(SourceDir)/{GUILE-Version,HACKING} $(InstallDir)/$(DocDir)/$(Name)
endef
