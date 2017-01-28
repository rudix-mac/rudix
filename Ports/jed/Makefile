BuildRequires += $(LibDir)/libslang.a # static-slang

include ../../Library/GNU.mk

Description=	JED is a freely available text editor for Unix
Title=		JED
Name=		jed
Version=	0.99
Site=		http://www.jedsoft.org/jed/
Source=		ftp://space.mit.edu/pub/davis/jed/v$(Version)/$(Name)-$(Version)-19.tar.bz2

UncompressedName=jed-$(Version)-19

EnvExtra += JED_ROOT=$(DataDir)/jed

define test_inner_hook
$(BinDir)/jed --version | grep $(Version)
endef
