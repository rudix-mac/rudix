BuildRequires += $(LibDir)/libusb-1.0.la # static-libusb

include ../../Library/GNU.mk

Title=		Dfu-programmer
Name=		dfu-programmer
Version=	0.6.0
Revision=	0
Site=		http://dfu-programmer.sourceforge.net/
URL=		http://downloads.sourceforge.net/dfu-programmer
Source=		$(Name)-$(Version).tar.gz
License=	GPL

CFlags += -I/usr/local/include/libusb-1.0
LdFlags += -L/usr/local/lib -lusb-1.0
LdFlags += -framework CoreFoundation -framework IOkit -lobjc
