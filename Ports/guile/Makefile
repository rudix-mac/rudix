include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libgmp.la	# gmp
BuildRequires += $(LibDir)/libintl.la	# gettext
BuildRequires += $(LibDir)/libltdl.la	# libtool
BuildRequires += $(LibDir)/libffi.la	# libffi

Title=		GNU Guile
Name=		guile
Version=	2.2.6
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.xz
License=	LGPLv2

LicenseFile=	$(SourceDir)/LICENSE

EnvExtra += LIBFFI_CFLAGS="$(shell --cflags libffi)"
EnvExtra += LIBFFI_LIBS="$(shell --libs libffi)"
# GnuConfigureExtra += "--disable-error-on-warning"

define after_install_hook
install -m 644 $(SourceDir)/{GUILE-Version,HACKING} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/guile -v | grep $(Version)
endef
