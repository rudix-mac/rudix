BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libgmp.la # Prefer Version 5
BuildRequires += $(LibDir)/libintl.la
BuildRequires += $(LibDir)/libgc.la
BuildRequires += $(LibDir)/libunistring.la

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
