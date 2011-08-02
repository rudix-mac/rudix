include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Multilanguage implementation of ctags
Site=		http://ctags.sourceforge.net/
License=	GPL
Title=		Exuberant Ctags
Name=		ctags
Version=	5.8
Revision=	2
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra = --enable-etags
GnuMakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/$(Prefix)
GnuMakeInstallExtra += mandir=$(PortDir)/$(InstallDir)/$(ManDir)

define install_post_hook
install	-m 644 $(SourceDir)/{FAQ,*.html} $(InstallDir)/$(DocDir)/$(Name)
endef
