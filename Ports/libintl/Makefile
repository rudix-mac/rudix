include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		libintl
Name=		libintl
Version=	0.18.1.1
Revision=	5
URL=		http://ftp.gnu.org/gnu/gettext/
Source=		gettext-$(Version).tar.gz

UncompressedName=gettext-$(Version)
BuildDir=$(SourceDir)/gettext-runtime

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-threads
GnuConfigureExtra += --disable-java
GnuConfigureExtra += --disable-csharp
GnuConfigureExtra += --disable-static
GnuConfigureExtra += --disable-libasprintf
GnuConfigureExtra += --with-included-glib

define install_post_hook
rm -rf $(InstallDir)/$(BinDir)
#rm -f $(InstallDir)/$(LibDir)/libintl.la
#rm -rf $(InstallDir)/$(IncludeDir)
rm -rf $(InstallDir)/$(ManDir)
rm -rf $(InstallDir)/$(DocDir)/gettext
rm -rf $(InstallDir)/$(DataDir)/locale
rm -rf $(InstallDir)/$(DataDir)/gettext
rm -rf $(InstallDir)/$(DocDir)/gettext/examples
endef

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
