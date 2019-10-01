BuildRequires += $(BinDir)/libtool # libtool
Requires += org.rudix.pkg.libtool,libtool,libtoolinstall.pkg

include ../../Library/GNU.mk

GnuConfigureExtra += --build=x86_64-apple-darwin

Title=		Gforh
Name=		gforth
Version=	0.7.3
Site=		$(GnuHome)/$(Name)
Source=		http://www.complang.tuwien.ac.at/forth/gforth//$(Name)-$(Version).tar.gz
License=	GPL

# Don't do parallel builds (won't work).
make=make -j1

CFlags=
LdFLags=
EnvExtra += GNU_LIBTOOL=$(BinDir)/libtool
