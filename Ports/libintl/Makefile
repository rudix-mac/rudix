include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNU GetText (libintl)
Site=		http://www.gnu.org/software/gettext/
License=	GPL
Title=		GNU gettext (libintl)
Name=		libintl
Version=	0.18.1.1
Revision=	3
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
rm -rf $(InstallDir)$(DocDir)/gettext/examples
endef
