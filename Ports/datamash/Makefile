include ../../Library/GNU.mk

Title=		GNU Datamash
Name=		datamash
Version=	1.4
Site=		https://www.gnu.org/software/datamash/
Source=		https://ftp.gnu.org/gnu/datamash/$(Name)-$(Version).tar.gz
License=	GPLv3

define test_hook
$(BinDir)/datamash --version | grep $(Version)
endef
