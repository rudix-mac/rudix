include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Multilanguage implementation of ctags
Site=		http://ctags.sourceforge.net/
License=	GPL
Title=		Exuberant Ctags $(Version)
Name=		ctags
Version=	5.8
Revision=	1
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra = --program-prefix=exuberant-
GnuMakeInstallExtra += prefix=$(InstallDir)/$(Prefix)
GnuMakeInstallExtra += mandir=$(InstallDir)/$(Mandir)

define install_post_hook
cd $(InstallDir)/$(BinDir) ; \
ln -sf exuberant-ctags ctags ; ln -sf exuberant-ctags etags
cd $(InstallDir)/$(ManDir)/man1 ; \
ln -sf exuberant-ctags.1 ctags.1 ; ln -sf exuberant-ctags.1 etags.1
install	-m 644 $(SourceDir)/{FAQ,*.html} $(InstallDir)/$(DocDir)/$(Name)
endef
