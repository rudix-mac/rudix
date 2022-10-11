include ../../Library/GNU.mk

Title=		GNU Bash
Name=		bash
Version=	5.2
Site=		https://www.gnu.org/software/bash/
Source=		https://ftp.gnu.org/gnu/bash//bash-$(Version).tar.gz
License=	GPLv3

GnuConfigureExtra += --with-included-gettext

define after_install_hook
cd $(DestDir)$(BinDir) ; ln -sf bash bash5
cd $(DestDir)$(ManDir) ; ln -sf bash.1 bash5.1
cd $(DestDir)$(ManDir) ; ln -sf bashbug bashbug5
for x in COMPAT POSIX RBASH Y2K ; do \
	install -m 644 $(SourceDir)/$$x $(DestDir)/$(DocDir)/$(Name) ; \
done
endef

define test_hook
$(BinDir)/bash --version | grep $(Version)
endef
