include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Exuberant Ctags
Name=		ctags
Version=	5.8
Revision=	3
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra = --enable-etags
MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/$(Prefix)
MakeInstallExtra += mandir=$(PortDir)/$(InstallDir)/$(ManDir)

define install_post_hook
install	-m 644 $(SourceDir)/{FAQ,*.html} $(InstallDir)/$(DocDir)/$(Name)
endef
