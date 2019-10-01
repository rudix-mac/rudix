include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libgmp.la	# gmp
BuildRequires += $(LibDir)/libintl.la	# gettext
BuildRequires += $(LibDir)/libltdl.la	# libtool

Title=		GNU Guile
Name=		guile
Version=	2.0.13
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/guile/guile-$(Version).tar.gz
License=	LGPLv2

LicenseFile=	$(SourceDir)/LICENSE

EnvExtra += 	LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra +=	LIBFFI_LIBS="-L/usr/local/lib -lffi"

define after_install_hook
install -m 644 $(SourceDir)/{GUILE-Version,HACKING} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/guile -v | grep $(Version)
endef
