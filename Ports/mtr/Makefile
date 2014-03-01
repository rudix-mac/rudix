include ../../Library/GNU.mk

Title=		MTR
Name=		mtr
Version=	0.85
Revision=	0
Site=		http://www.bitwizard.nl/mtr/
URL=		https://github.com/traviscross/mtr/archive
Source=		v$(Version).tar.gz
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
