include ../../Library/GNU.mk

Title=		GNU Readline
Name=		readline
Version=	8.0
Site=		https://tiswww.case.edu/php/chet/readline/rltop.html
Source=		$(GnuMirror)/readline/$(Name)-$(Version).tar.gz
License=	GPLv3

GnuConfigureExtra += --with-curses
GnuMakeInstallExtra += install-doc

define after_install_hook
install -m 644 $(SourceDir)/doc/*.html \
	$(DestDir)/$(DocDir)/$(Name)
chmod u+w $(DestDir)$(LibDir)/*.dylib || true
rmdir $(DestDir)$(BinDir) || true
endef

define test_hook
test -f $(LibDir)/pkgconfig/readline.pc
endef
