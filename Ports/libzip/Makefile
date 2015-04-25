include ../../Library/GNU.mk

Title=		libzip
Name=		libzip
Version=	0.12.2
Revision=	0
Site=		http://nih.at/libzip/
Source=		http://nih.at/libzip//$(Name)-$(Version).tar.bz2
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
/usr/local/bin/zipcmp -h
/usr/local/bin/zipmerge -h
endef
