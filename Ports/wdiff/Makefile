include ../../Library/GNU.mk

Title=		GNU Wdiff
Name=		wdiff
Version=	1.2.2
Site=		http://www.gnu.org/software/wdiff/
Source=		http://ftp.gnu.org/gnu/wdiff//$(Name)-$(Version).tar.gz
License=	GPL

define test_hook
$(BinDir)/wdiff --version | grep $(Version)
endef
