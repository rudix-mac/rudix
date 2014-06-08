include ../../Library/GNU.mk

Title=		GNU Gzip
Name=		gzip
Version=	1.6
Revision=	0
Site=		http://www.gnu.org/software/gzip/
URL=		http://ftp.gnu.org/gnu/gzip/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
./links.sh $(InstallDir)/$(BinDir)
./links.sh $(InstallDir)/$(ManDir)/man1
cd $(InstallDir)/$(InfoDir) && ln -sf gzip.info gnugzip.info
endef

define test_inner_hook
$(BinDir)/gzip --version
endef
