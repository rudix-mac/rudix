include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Vifm
Name=		vifm
Version=	0.7.2
Revision=	0
URL=		http://sourceforge.net/projects/vifm/files/vifm/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define explode
mkdir -p $(Name)-$(Version) ; cd $(Name)-$(Version) ; tar zxvf ../$(Source)
endef

GnuConfigureExtra += --with-gtk=no
