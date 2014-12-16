BuildRequires += $(BinDir)/autoconf # autoconf >= 2.62

include ../../Library/GNU.mk

Title=		GNU Automake
Name=		automake
Version=	1.14.1
Revision=	0
Site=		http://www.gnu.org/software/automake/
URL=		http://ftp.gnu.org/gnu/automake/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

EnvExtra += AUTOCONF=$(BinDir)/autoconf

define test_inner_hook
$(BinDir)/automake --version | grep $(Version)
endef
