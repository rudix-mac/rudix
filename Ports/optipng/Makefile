BuildRequires += $(LibDir)/libpng.la

include ../../Library/Config.mk
RUDIX_ENABLE_NLS=
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		OptiPNG
Name=		optipng
Version=	0.7
Revision=	0
URL=		http://sourceforge.net/projects/optipng/files/OptiPNG/$(Name)-$(Version)/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README.txt
LicenseFile=	$(BuildDir)/LICENSE.txt

GnuMakeInstallExtra+= mandir=$(ManDir)
GnuConfigureExtra += --with-system-libpng

define gnu_configure
./configure $(GnuConfigureExtra)
endef
