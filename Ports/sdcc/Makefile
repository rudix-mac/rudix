BuildRequires += $(IncludeDir)/boost/graph/adjacency_list.hpp
#BuildRequires += $(LibDir)/libgc.la

include ../../Library/GNU.mk

Title=		SDCC
Name=		sdcc
Version=	3.1.0
Revision=	0
Site=		http://sdcc.sourceforge.net/
URL=		http://sourceforge.net/projects/sdcc/files/sdcc/$(Version)
Source=		$(Name)-src-$(Version).tar.bz2
License=	GPL

UncompressedName = $(Name)


GnuConfigureExtra += --disable-pic14-port --disable-pic16-port
