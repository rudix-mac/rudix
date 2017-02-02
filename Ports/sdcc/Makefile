BuildRequires += $(IncludeDir)/boost/graph/adjacency_list.hpp # boost
BuildRequires += $(BinDir)/gpasm # gptools

include ../../Library/GNU.mk

Title=		SDCC
Name=		sdcc
Version=	3.4.0
Site=		http://sdcc.sourceforge.net/
Source=		http://sourceforge.net/projects/sdcc/files/sdcc/$(Version)/$(Name)-src-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra += --disable-werror
GnuConfigureExtra += --disable-ds390-port --disable-ds400-port --disable-mcs51-port

MakeFlags =

define test_hook
$(BinDir)/sdcc --version | grep $(Version)
endef
