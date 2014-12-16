include ../../Library/GNU.mk

Title=		iftop
Name=		iftop
Version=	1.0
Revision=	2
Site=		http://www.ex-parrot.com/pdw/iftop/
URL=		http://www.ex-parrot.com/pdw/iftop/download
Source=		$(Name)-$(Version)pre4.tar.gz
License=	GPL

UncompressedName=$(Name)-$(Version)pre4

define test_inner_hook
$(SBinDir)/iftop -h | grep $(Version)
endef
