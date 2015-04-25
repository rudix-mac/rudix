include ../../Library/GNU.mk

Title=		Argtable
Name=		argtable
Version=	2.13
Revision=	3
Site=		http://argtable.sourceforge.net
Source=		http://downloads.sourceforge.net/argtable/$(Name)2-13.tar.gz
License=	LGPL

UncompressedName = $(Name)2-13

GnuConfigureExtra += --docdir=$(DataDir)/doc/argtable

define test_inner_hook
cd $(BuildDir)/example && make LDFLAGS=-L$(LibDir)
endef
