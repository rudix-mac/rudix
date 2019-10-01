include ../../Library/GNU.mk

Title=		GNU Tar
Name=		tar
Version=	1.30
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/tar//$(Name)-$(Version).tar.bz2
License=	GPL

# GnuConfigureExtra += --program-prefix=gnu

define after_install_hook
cd $(InstallDir)/$(BinDir) && ln -sf gnutar tar
endef

define test_hook
$(BinDir)/tar --version | grep $(Version)
endef
