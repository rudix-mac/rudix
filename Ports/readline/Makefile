include ../../Library/GNU.mk

Title=		GNU Readline
Name=		readline
Version=	6.2
Revision=	1
URL=		http://ftp.gnu.org/gnu/readline/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-curses
GnuMakeInstallExtra += install-doc

define install_post_hook
install -m 644 $(SourceDir)/doc/*.html $(InstallDir)/$(DocDir)/$(Name)
#chmod u+w $(InstallDir)$(LibDir)/*.dylib
#rmdir $(InstallDir)$(BinDir)
endef

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
