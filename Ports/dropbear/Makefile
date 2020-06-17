# Dropbear is a relatively small SSH server and client

include ../../Library/GNU.mk

Title=		Dropbear SSH
Name=		dropbear
Version=	2019.78
Site=		https://matt.ucc.asn.au/dropbear/dropbear.html
Source=		https://matt.ucc.asn.au/dropbear/releases/dropbear-$(Version).tar.bz2
License=        MIT-style
LicenseFile=	$(SourceDir)/LICENSE

GnuConfigureExtra+=--sbindir=$(BinDir)

define test_hook
$(BinDir)/dbclient -V
$(BinDir)/dropbear -V
endef
