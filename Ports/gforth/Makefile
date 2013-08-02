BuildRequires += $(BinDir)/libtool # libtool

include ../../Library/GNU.mk

ifeq ($(OSXVersion),10.6)
GnuConfigureExtra += --build=i386-apple-darwin
else
GnuConfigureExtra += --build=x86_64-apple-darwin
endif

Title=		Gforh
Name=		gforth
Version=	0.7.2
Revision=	0
URL=		http://www.complang.tuwien.ac.at/forth/gforth/
Source=		$(Name)-$(Version).tar.gz

# Don't do parallel builds (won't work).
make=make -j1

CFlags=
LdFLags=
EnvExtra += GNU_LIBTOOL=$(BinDir)/libtool
