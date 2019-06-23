include ../../Library/GNU.mk

Title=		Exuberant Ctags
Name=		ctags
Version=	5.8
Site=		http://ctags.sourceforge.net/
Source=		http://downloads.sourceforge.net/ctags/$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra = --enable-etags
MakeInstallExtra += prefix=$(DestDir)/$(Prefix)
MakeInstallExtra += mandir=$(DestDir)/$(ManDir)

define after_install_hook
install	-m 644 $(SourceDir)/{FAQ,*.html} $(DestDir)/$(DocDir)/$(Name)
cd $(DestDir)/$(BinDir) ; ln -sf ctags exuberant-ctags ; ln -sf etags exuberant-etags
cd $(DestDir)/$(ManDir)/man1 ; ln -sf ctags.1 exuberant-ctags.1 ; ln -sf etags.1 exuberant-etags.1
endef

define test_hook
$(BinDir)/ctags --version | grep $(Version)
endef
