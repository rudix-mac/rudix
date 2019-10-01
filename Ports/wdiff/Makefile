include ../../Library/GNU.mk

Title=		GNU Wdiff
Name=		wdiff
Version=	1.2.2
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/wdiff//$(Name)-$(Version).tar.gz
License=	GPL

define test_hook
$(BinDir)/wdiff --version | grep $(Version)
endef
