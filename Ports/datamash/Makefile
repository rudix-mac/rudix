include ../../Library/GNU.mk

Title=		GNU Datamash
Name=		datamash
Version=	1.4
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.gz
License=	GPLv3

define test_hook
$(BinDir)/datamash --version | grep $(Version)
endef
