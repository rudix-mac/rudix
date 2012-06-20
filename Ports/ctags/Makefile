include ../../Library/GNU.mk

Title=		Exuberant Ctags
Name=		ctags
Version=	5.8
Revision=	5
URL=		http://downloads.sourceforge.net/ctags
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra = --enable-etags
MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/$(Prefix)
MakeInstallExtra += mandir=$(PortDir)/$(InstallDir)/$(ManDir)

define install_post_hook
install	-m 644 $(SourceDir)/{FAQ,*.html} $(InstallDir)/$(DocDir)/$(Name)
endef

define final_inner_hook
$(BinDir)/ctags --version
endef
