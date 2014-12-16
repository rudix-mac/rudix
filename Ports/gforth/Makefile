BuildRequires += $(BinDir)/libtool # libtool
Requires += org.rudix.pkg.libtool,libtool,libtoolinstall.pkg

include ../../Library/GNU.mk

ifeq ($(OSXVersion),10.6)
GnuConfigureExtra += --build=i386-apple-darwin
RUDIX_UNIVERSAL=no
else
GnuConfigureExtra += --build=x86_64-apple-darwin
endif

Title=		Gforh
Name=		gforth
Version=	0.7.2
Revision=	0
Site=		http://www.gnu.org/software/gforth/
URL=		http://www.complang.tuwien.ac.at/forth/gforth/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

# Don't do parallel builds (won't work).
make=make -j1

CFlags=
LdFLags=
EnvExtra += GNU_LIBTOOL=$(BinDir)/libtool
