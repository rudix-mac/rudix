BuildRequires += $(LibDir)/libusb-1.0.la # libusb

include ../../Library/GNU.mk

Title=		Dfu-programmer
Name=		dfu-programmer
Version=	0.7.2
Site=		http://dfu-programmer.github.io/
Source=		http://downloads.sourceforge.net/dfu-programmer/$(Name)-$(Version).tar.gz
License=	GPL

CFlags += -I/usr/local/include/libusb-1.0
LdFlags += -L/usr/local/lib -lusb-1.0
LdFlags += -framework CoreFoundation -framework IOkit -lobjc
