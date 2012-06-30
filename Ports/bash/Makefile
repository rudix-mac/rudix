BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		GNU Bash
Name=		bash
Version=	4.2
Revision=	4
URL=		http://ftp.gnu.org/gnu/bash/
Source=		bash-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

#GnuConfigureExtra += --with-included-gettext

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf bash bash4
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf bash.1 bash4.1
install -m 644 $(SourceDir)/{COMPAT,POSIX,RBASH,Y2K} $(InstallDir)/$(DocDir)/$(Name)
chmod 755 $(InstallDir)$(BinDir)/bashbug
endef

define final_inner_hook
$(BinDir)/bash --version
endef
