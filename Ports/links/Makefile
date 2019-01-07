include ../../Library/GNU.mk

Title=		Links
Name=		links
Version=	2.18
Site=		http://links.twibright.com/
Source=		http://links.twibright.com/download/$(Name)-$(Version).tar.bz2
License=	GPLv2

define test_hook
$(BinDir)/links -version | grep $(Version)
endef
