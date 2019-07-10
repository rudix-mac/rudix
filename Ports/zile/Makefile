BuildRequires += $(LibDir)/libgc.la # gc
BuildRequires += $(BinDir)/pkg-config # pkg-config

include ../../Library/GNU.mk

Title=		GNU Zile
Name=		zile
Version=	2.4.11
Site=		http://www.gnu.org/software/zile/
Source=		http://ftp.gnu.org/gnu/zile//$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-help2man=/usr/bin/true

define test_hook
$(BinDir)/zile --version | grep $(Version)
endef
