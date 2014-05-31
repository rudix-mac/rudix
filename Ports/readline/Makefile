include ../../Library/GNU.mk

Title=		GNU Readline
Name=		readline
Version=	6.3
Revision=	0
URL=		http://ftp.gnu.org/gnu/readline/
Source=		$(Name)-$(Version).tar.gz

GnuConfigureExtra += --with-curses
GnuMakeInstallExtra += install-doc

define install_post_hook
install -m 644 $(SourceDir)/doc/*.html \
	$(InstallDir)/$(DocDir)/$(Name)
chmod u+w $(InstallDir)$(LibDir)/*.dylib || true
rmdir $(InstallDir)$(BinDir) || true
endef
