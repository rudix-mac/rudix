include ../../Library/GNU.mk

Title=		Rsync
Name=		rsync
Version=	3.2.3
Site=		https://rsync.samba.org/
Source=		https://download.samba.org/pub/rsync/src/rsync-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-included-popt
GnuConfigureExtra += --with-rsyncd-conf=$(Prefix)/etc

define after_install_hook
cd $(InstallDir)/$(BinDir) && ln -sf rsync rsync3
cd $(InstallDir)/$(Prefix)/share/man/man1 && ln -sf rsync.1 rsync3.1
cd $(InstallDir)/$(Prefix)/share/man/man5 && ln -sf rsyncd.conf.5 rsyncd3.conf.5
endef

define test_hook
$(BinDir)/rsync --version | grep $(Version)
endef
