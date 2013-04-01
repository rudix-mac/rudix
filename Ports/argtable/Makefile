include ../../Library/GNU.mk

Title=		Argtable
Name=		argtable
Version=	2.13
Revision=	2
URL=		http://prdownloads.sourceforge.net/argtable
Source=		$(Name)2-13.tar.gz

UncompressedName = $(Name)2-13

GnuConfigureExtra += --docdir=$(DataDir)/doc/argtable

define test_inner_hook
cd $(BuildDir)/example && make
endef
