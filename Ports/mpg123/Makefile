include ../../Library/GNU.mk

Title=		MPG123
Name=		mpg123
Version=	1.22.4
Site=		http://www.mpg123.de/
Source=		http://www.mpg123.de/download/$(Name)-$(Version).tar.bz2
License=	LGPL

define after_install_hook
rm -rf $(SourceDir)/doc/examples/
install -m 644 $(SourceDir)/doc/* $(DestDir)$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/mpg123 --version | grep $(Version)
endef
