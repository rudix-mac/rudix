include ../../Library/GNU.mk

Description=	Source code tag system that works the same way across diverse environments
Title=		GNU Global
Name=		global
Version=	6.3.2
Site=		https://www.gnu.org/software/global/
Source=		http://ftp.gnu.org/gnu/global//$(Name)-$(Version).tar.gz
License=	GPL

define test_hook
$(BinDir)/global --version | grep $(Version)
endef
