BuildRequires += $(BinDir)/autoconf	# autoconf >= 2.65

include ../../Library/GNU.mk

Title=		GNU Automake
Name=		automake
Version=	1.16.1
Site=		https://www.gnu.org/software/automake/
Source=		https://ftp.gnu.org/gnu/automake/$(Name)-$(Version).tar.xz
License=	GPLv2

EnvExtra += AUTOCONF=$(BinDir)/autoconf

define test_hook
$(BinDir)/automake --version | grep $(Version)
endef
