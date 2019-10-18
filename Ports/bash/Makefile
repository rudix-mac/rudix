include ../../Library/GNU.mk

Title=		GNU Bash
Name=		bash
Version=	4.4
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.gz
License=	GPLv3

GnuConfigureExtra += --with-included-gettext

define after_install_hook
cd $(DestDir)$(BinDir) ; ln -sf bash bash4
cd $(DestDir)$(ManDir) ; ln -sf bash.1 bash4.1
for x in COMPAT POSIX RBASH Y2K ; do \
	install -m 644 $(SourceDir)/$$x $(DestDir)/$(DocDir)/$(Name) ; \
done
rm -f $(DestDir)$(BinDir)/bashbug
endef

define test_hook
$(BinDir)/bash --version | grep $(Version)
# CVE-2014-6271
env X="() { :;} ; echo CVE-2014-6271 ; exit 1" $(BinDir)/bash -c true
endef
