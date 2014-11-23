include ../../Library/GNU.mk

Description=	Source code tag system that works the same way across diverse environments
Title=		GNU Global
Name=		global
Version=	6.3.2
Revision=	0
Site=		https://www.gnu.org/software/global/
URL=		http://ftp.gnu.org/gnu/global/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/global --version | grep $(Version)
endef
