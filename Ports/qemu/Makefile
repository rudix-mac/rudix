BuildRequires += /usr/local/bin/pkg-config
BuildRequires += /usr/local/lib/libglib-2.0.la

include ../../Library/Config.mk
RUDIX_UNIVERSAL=no
include ../../Library/Rudix.mk
include ../../Library/ConfigureFormula.mk

Title=		QEMU
Name=		qemu
Version=	1.0.1
Revision=	0
URL=		http://wiki.qemu.org/download/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/qemu-doc.html
LicenseFile=	$(SourceDir)/LICENSE

#ConfigureExtra += --enable-cocoa
#ConfigureExtra += --disable-bsd-user
#ConfigureExtra += --disable-darwin-user
