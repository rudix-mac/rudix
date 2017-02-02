BuildRequires += $(BinDir)/autoconf # autoconf >= 2.62

include ../../Library/GNU.mk

Title=		GNU Automake
Name=		automake
Version=	1.15
Site=		http://www.gnu.org/software/automake/
Source=		http://ftp.gnu.org/gnu/automake/$(Name)-$(Version).tar.xz
License=	GPL

EnvExtra += AUTOCONF=$(BinDir)/autoconf

define test_hook
$(BinDir)/automake --version | grep $(Version)
endef
