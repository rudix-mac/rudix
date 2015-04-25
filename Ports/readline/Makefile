include ../../Library/GNU.mk

Title=		GNU Readline
Name=		readline
Version=	6.3
Revision=	0
Site=		http://tiswww.case.edu/php/chet/readline/rltop.html
Source=		http://ftp.gnu.org/gnu/readline//$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-curses
GnuMakeInstallExtra += install-doc

define install_post_hook
install -m 644 $(SourceDir)/doc/*.html \
	$(InstallDir)/$(DocDir)/$(Name)
chmod u+w $(InstallDir)$(LibDir)/*.dylib || true
rmdir $(InstallDir)$(BinDir) || true
endef
