include ../../Library/GNU.mk

Title=		GNU Bash
Name=		bash
Version=	4.3
Revision=	0
Site=		http://www.gnu.org/software/bash/
URL=		http://ftp.gnu.org/gnu/bash/
Source=		bash-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-included-gettext

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf bash bash4
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf bash.1 bash4.1
install -m 644 $(SourceDir)/{COMPAT,POSIX,RBASH,Y2K} $(InstallDir)/$(DocDir)/$(Name)
chmod 755 $(InstallDir)$(BinDir)/bashbug
endef

define test_inner_hook
$(BinDir)/bash --version | grep $(Version)
endef
