include ../../Library/GNU.mk

Title=		Libxml2
Name=		libxml2
Version=	2.9.9
Site=		http://www.xmlsoft.org/FAQ.html
Source=		ftp://xmlsoft.org/libxml2/libxml2-2.9.9.tar.gz
License=        MIT

define test_hook
$(BinDir)/libxml2 --version | grep $(Version)
endef
