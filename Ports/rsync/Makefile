include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Rsync
Name=		rsync
Version=	3.0.9
Revision=	1
URL=		http://samba.org/ftp/rsync/src/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-included-popt
GnuConfigureExtra += --with-rsyncd-conf=$(Prefix)/etc

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf rsync rsync3
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf rsync.1 rsync3.1
cd $(InstallDir)$(Prefix)/share/man/man5 ; ln -sf rsyncd.conf.5 rsyncd3.conf.5
endef
