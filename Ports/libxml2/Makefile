include ../../Library/GNU.mk

Title=	Libxml2
Name=	libxml2
Version=v2.9.10
#Site=		http://www.xmlsoft.org/FAQ.html
Site=	https://gitlab.gnome.org/GNOME/$(Name)
Source=	$(Site)/-/archive/$(Version)/$(Name)-$(Version).tar.bz2
License=MIT

define before_build_hook
$(verify_buildrequires)
cd $(BuildDir) && ./autogen.sh
endef

define test_hook
$(BinDir)/libxml2 --version | grep $(Version)
endef
