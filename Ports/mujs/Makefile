include ../../Library/Unix.mk

Title=		MuJS
Name=		mujs
Version=	1.3.0
Site=		https://mujs.com/
Source=		https://mujs.com/downloads/mujs-$(Version).tar.gz
License=	ISC

define test_hook
$(BinDir)/mujs < /dev/null | grep $(Version)
endef
