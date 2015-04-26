include ../../Library/GNU.mk

Title=		MPG123
Name=		mpg123
Version=	1.22.1
Revision=	0
Site=		http://www.mpg123.de/
Source=		http://www.mpg123.de/download/$(Name)-$(Version).tar.bz2
License=	LGPL

define install_post_hook
rm -rf $(SourceDir)/doc/examples/
install -m 644 $(SourceDir)/doc/* $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/mpg123 --version | grep $(Version)
endef
