include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		GNU gettext
Name=		gettext
Version=	0.18.1.1
Revision=	4
URL=		http://ftp.gnu.org/gnu/gettext/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --with-included-glib

define install_post_hook
rm -rf $(InstallDir)$(DocDir)/gettext/examples
endef

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif