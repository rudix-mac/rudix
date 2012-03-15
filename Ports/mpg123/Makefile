include ../../Library/Config.mk
RUDIX_UNIVERSAL=no
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		MPG123
Name=		mpg123
Version=	1.13.6
Revision=	0
URL=		http://www.mpg123.de/download/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-cpu=x86-64

define install_post_hook
rm -rf $(SourceDir)/doc/examples/
install -m 644 $(SourceDir)/doc/* $(InstallDir)/$(DocDir)/$(Name)
endef
