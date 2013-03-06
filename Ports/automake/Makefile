# Autoconf 2.62 or better is required.
BuildRequires += $(BinDir)/autoconf

include ../../Library/GNU.mk

Title=		GNU Automake
Name=		automake
Version=	1.13.1
Revision=	0
URL=		http://ftp.gnu.org/gnu/automake/
Source=		$(Name)-$(Version).tar.gz


EnvExtra += AUTOCONF=/usr/local/bin/autoconf

define test_inner_hook
$(BinDir)/automake --version
endef
