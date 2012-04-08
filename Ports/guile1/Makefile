BuildRequires += $(LibDir)/libgmp.la # Prefer version 4
BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		GNU Guile (Version 1)
Name=		guile1
Version=	1.8.8
Revision=	0
URL=		http://ftp.gnu.org/gnu/guile/
Source=		guile-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName = guile-$(Version)

EnvExtra += 	LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra +=	LIBFFI_LIBS="-L/usr/local/lib -lffi"

define install_post_hook
install -m 644 $(SourceDir)/{GUILE-Version,HACKING} $(InstallDir)/$(DocDir)/$(Name)
endef
