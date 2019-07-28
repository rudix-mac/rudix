include ../../Library/GNU.mk

Title=		bc
Name=		bc
Version=	1.07.1
Site=		https://www.gnu.org/software/bc/
Source=		https://ftp.gnu.org/gnu/bc/bc-$(Version).tar.gz
License=        GPLv3

GnuConfigureExtra += --with-libedit

define test_hook
$(BinDir)/bc --version | grep $(Version)
otool -L $(BinDir)/bc | grep libedit
endef
