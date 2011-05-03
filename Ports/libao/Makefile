BuildRequires += $(BinDir)/pkg-config

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	libao: a cross platform audio library
Site=		http://xiph.org/ao/
License=	GPL
Title=		Libao
Name=		libao
Version=	1.1.0
Revision=	0
URL=		http://downloads.xiph.org/releases/ao/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-static
