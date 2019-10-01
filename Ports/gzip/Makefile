include ../../Library/GNU.mk

Title=		GNU Gzip
Name=		gzip
Version=	1.8
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/gzip//$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --program-prefix=gnu

define after_install_hook
./links.sh $(InstallDir)/$(BinDir)
./links.sh $(InstallDir)/$(ManDir)/man1
cd $(InstallDir)/$(InfoDir) && ln -sf gzip.info gnugzip.info
endef

define test_hook
$(BinDir)/gzip --version | grep $(Version)
endef
