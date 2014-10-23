include ../../Library/GNU.mk

Title=		Rsync
Name=		rsync
Version=	3.1.1
Revision=	0
Site=		http://samba.org/rsync/
URL=		http://samba.org/ftp/rsync/src/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-included-popt
GnuConfigureExtra += --with-rsyncd-conf=$(Prefix)/etc

define prep_post_hook
patch -p1 -d $(SourceDir) < patches/fileflags.diff
patch -p1 -d $(SourceDir) < patches/crtimes.diff
patch -p1 -d $(SourceDir) < patches/hfs-compression.diff
cd $(BuildDir) && ./prepare-source
endef

define install_post_hook
cd $(InstallDir)/$(BinDir) ; ln -sf rsync rsync3
cd $(InstallDir)/$(Prefix)/share/man/man1 ; ln -sf rsync.1 rsync3.1
cd $(InstallDir)/$(Prefix)/share/man/man5 ; ln -sf rsyncd.conf.5 rsyncd3.conf.5
endef

define test_inner_hook
$(BinDir)/rsync --version | grep $(Version)
endef
