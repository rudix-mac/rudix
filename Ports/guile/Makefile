BuildRequires += $(LibDir)/libgmp.la
BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		GNU Guile
Name=		guile
Version=	2.0.5
Revision=	0
URL=		http://ftp.gnu.org/gnu/guile/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

EnvExtra += 	LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra +=	LIBFFI_LIBS="-L/usr/local/lib -lffi"

define install_post_hook
install -m 644 $(SourceDir)/{GUILE-Version,HACKING} $(InstallDir)/$(DocDir)/$(Name)
endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libgmp.a
endif
