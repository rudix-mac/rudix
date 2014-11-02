BuildRequires += $(LibDir)/libslang.a # static-slang

include ../../Library/GNU.mk

Description=	S-Lang read news is a newsreader
Title=		slrn
Name=		slrn
Version=	1.0.2
Revision=	0
Site=		http://slrn.sourceforge.net
URL=		http://www.jedsoft.org/releases/slrn
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/slrn --version | grep $(Version)
endef
