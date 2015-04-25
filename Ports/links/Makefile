include ../../Library/GNU.mk

Title=		Links
Name=		links
Version=	2.8
Revision=	0
Site=		http://links.twibright.com/
Source=		http://links.twibright.com/download/$(Name)-$(Version).tar.bz2
License=	GPL

define test_inner_hook
$(BinDir)/links -version | grep $(Version)
endef
