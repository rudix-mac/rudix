include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNU GetText
Site=		http://www.gnu.org/software/gettext/
License=	GPL
Title=		GNU gettext
Name=		gettext
Version=	0.18.1.1
Revision=	2
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
