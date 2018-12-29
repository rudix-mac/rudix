include ../../Library/GNU.mk

Title=		GNU Tar
Name=		tar
Version=	1.30
Site=		http://www.gnu.org/software/tar/
Source=		http://ftp.gnu.org/gnu/tar//$(Name)-$(Version).tar.bz2
License=	GPL

# GnuConfigureExtra += --program-prefix=gnu

# define install_post_hook
# cd $(InstallDir)/$(BinDir) && ln -sf gnutar tar
# endef

define test_hook
$(BinDir)/tar --version | grep $(Version)
endef
