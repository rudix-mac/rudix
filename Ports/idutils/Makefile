include ../../Library/GNU.mk

Description=	ID database utilities
Title=		GNU ID Utils
Name=		idutils
Version=	4.6
Revision=	0
Site=		https://www.gnu.org/software/idutils/
Source=		http://ftp.gnu.org/gnu/idutils//$(Name)-$(Version).tar.xz
License=	GPL

define test_inner_hook
$(BinDir)/mkid --version | grep $(Version)
endef
