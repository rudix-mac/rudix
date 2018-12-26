include ../../Library/GNU.mk

Title=		GNU IDN Library
Name=		libidn2
Version=	2.0.5
Site=		http://www.gnu.org/software/libidn/
Source=		http://ftp.gnu.org/gnu/libidn/$(Name)-$(Version).tar.gz
License=	GPL+LGPL
ReadMeFile=	$(SourceDir)/README.md

define test_hook
$(BinDir)/idn --version | grep $(Version)
endef
