include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNU Readline library
Site=		http://tiswww.case.edu/php/chet/readline/rltop.html
License=	GPL
Title=		GNU Readline $(Version)
Name=		readline
Version=	6.2
Revision=	0
URL=		http://ftp.gnu.org/gnu/readline/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-curses
GnuMakeInstallExtra += install-doc

define install_post_hook
install -m 644 $(SourceDir)/doc/*.html $(InstallDir)/$(DocDir)/$(Name)
chmod u+w $(InstallDir)$(LibDir)/*.dylib
endef
