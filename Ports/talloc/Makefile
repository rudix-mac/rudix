include ../../Library/Configure.mk

Title=		Talloc
Name=		talloc
Version=	2.3.3
Site=		https://talloc.samba.org/
Source=		https://samba.org/ftp/talloc/$(Name)-$(Version).tar.gz
License=	LGPL

ReadMeFile=	README
LicenseFile=	LICENSE

ConfigureExtra += --without-gettext
ConfigureExtra += --disable-python

define test_hook
test -f $(LibDir)/pkgconfig/talloc.pc
endef
