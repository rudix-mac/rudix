include ../../Library/GNU.mk

Title=		GNU Datamash
Name=		datamash
Version=	1.0.6
Revision=	0
Site=		https://www.gnu.org/software/datamash/
Source=		http://ftp.gnu.org/gnu/datamash//$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/datamash --version | grep $(Version)
endef
