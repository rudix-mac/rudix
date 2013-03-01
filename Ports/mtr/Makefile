include ../../Library/GNU.mk

Title=		MTR
Name=		mtr
Version=	0.83
Revision=	0
URL=		ftp://ftp.bitwizard.nl/mtr/
Source=		$(Name)-$(Version).tar.gz

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
