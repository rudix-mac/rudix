include ../../Library/GNU.mk

Title=		GNU Bash
Name=		bash
Version=	4.4
Site=		http://www.gnu.org/software/bash/
Source=		http://ftp.gnu.org/gnu/bash//bash-$(Version).tar.gz
License=	GPLv3

GnuConfigureExtra += --with-included-gettext

define install_post_hook
cd $(DestDir)$(BinDir) ; ln -sf bash bash4
cd $(DestDir)$(ManDir) ; ln -sf bash.1 bash4.1
for x in COMPAT POSIX RBASH Y2K ; do \
	install -m 644 $(SourceDir)/$$x $(DestDir)/$(DocDir)/$(Name) ; \
done
rm -f $(DestDir)$(BinDir)/bashbug
endef

define test_inner_hook
$(BinDir)/bash --version | grep $(Version)
# CVE-2014-6271
env X="() { :;} ; echo CVE-2014-6271 ; exit 1" $(BinDir)/bash -c true
endef
