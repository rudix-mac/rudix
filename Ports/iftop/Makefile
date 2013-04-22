include ../../Library/GNU.mk

Title=		iftop
Name=		iftop
Version=	1.0pre2
Revision=	1
URL=		http://www.ex-parrot.com/pdw/iftop/download
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(SBinDir)/iftop -h | grep $(Version)
endef
