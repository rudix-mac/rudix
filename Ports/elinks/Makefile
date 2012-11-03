include ../../Library/Config.mk
RUDIX_UNIVERSAL=
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		ELinks
Name=		elinks
Version=	0.13
Revision=	0
URL=		http://elinks.or.cz/download/
Source=		$(Name)-current-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = elinks-$(Version)-20120407

define make
make
endef

define install_post_hook
rm -rf $(InstallDir)/$(LibDir)
endef

define test_inner_hook
/usr/local/bin/elinks --version
endef
