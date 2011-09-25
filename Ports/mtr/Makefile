include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	MTR combines the functionality of the traceroute and ping programs in a single network diagnostic tool
Site=		http://www.bitwizard.nl/mtr/
License=	GPL
Title=		MTR
Name=		mtr
Version=	0.80
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
