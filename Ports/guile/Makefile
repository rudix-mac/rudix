BuildRequires += $(LibDir)/libgmp.la
BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		GNU Guile)
Name=		guile
Version=	1.8.8
Revision=	0
URL=		http://ftp.gnu.org/gnu/guile/
Source=		guile-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

EnvExtra += 	LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra +=	LIBFFI_LIBS="-L/usr/local/lib -lffi"

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define install_post_hook
install -m 644 $(SourceDir)/{GUILE-Version,HACKING} $(InstallDir)/$(DocDir)/$(Name)
endef

define final_post_hook
$(BinDir)/guile -v
endef
