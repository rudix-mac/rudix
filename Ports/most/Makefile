BuildRequires += $(LibDir)/libslang.a # static-slang

include ../../Library/GNU.mk

Title=		MOST
Name=		most
Version=	5.0.0
Site=		http://www.jedsoft.org/most/
Source=		ftp://space.mit.edu/pub/davis/most//$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/most 2>&1 | grep 5.0.0 
endef
