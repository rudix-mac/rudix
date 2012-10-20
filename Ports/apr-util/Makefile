#BuildRequires += $(LibDir)/libapr-1.la

include ../../Library/GNU.mk

Title=		APR-util
Name=		apr-util
Version=	1.4.1
Revision=	1
URL=		http://www.apache.org/dist/apr/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/LICENSE

GnuConfigureExtra += --with-apr=$(BinDir)/apr-1-config

define test_inner_hook
$(BinDir)/apu-1-config --version
endef
