include ../../Library/GNU.mk

Title=		MTR
Name=		mtr
Version=	0.85
Revision=	0
Site=		https://github.com/traviscross/mtr
URL=		ftp://www.bitwizard.nl/mtr/
Source=		mtr-$(Version).tar.gz
License=	GPL

ConfigureExtra += --without-gtk
LdFlags += -lresolv

define prep_post_hook
rm -rf $(SourceDir)/autom4te.cache $(SourceDir)/{.deps,Makefile}
endef

define install_post_hook
install $(SourceDir)/{FORMATS,SECURITY,TODO} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(SBinDir)/mtr --version
endef
