BuildRequires += $(LibDir)/libgc.la # gc
BuildRequires += $(BinDir)/pkg-config # pkg-config

include ../../Library/GNU.mk
GnuMirror=https://ftp.gnu.org/gnu/

Title=		GNU Zile
Name=		zile
Version=	2.4.14
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-help2man=/usr/bin/true

define test_hook
$(BinDir)/zile --version | grep $(Version)
endef
