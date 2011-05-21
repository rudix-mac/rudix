include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Library that implements the rsync remote-delta algorithm
Site=		http://librsync.sourceforge.net/
License=	LGPL
Name=		librsync
Version=	0.9.7
Revision=	8
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-shared
GnuMakeExtra += LDFLAGS="$(LdFlags)"
