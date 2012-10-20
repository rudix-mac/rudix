include ../../Library/GNU.mk

Title=		MTR
Name=		mtr
Version=	0.82
Revision=	1
URL=		ftp://ftp.bitwizard.nl/mtr/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ConfigureExtra += --without-gtk
LdFlags += -lresolv

define prep_post_hook
rm -rf $(SourceDir)/autom4te.cache $(SourceDir)/{.deps,Makefile}
endef

define install_post_hook
install $(SourceDir)/{FORMATS,SECURITY,TODO} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
sudo $(SBinDir)/mtr --version
endef
