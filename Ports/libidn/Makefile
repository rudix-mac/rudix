include ../../Library/GNU.mk

Title=		GNU IDN Library
Name=		libidn
Version=	1.35
Site=		http://www.gnu.org/software/libidn/
Source=		http://ftp.gnu.org/gnu/libidn/$(Name)-$(Version).tar.gz
License=	GPL+LGPL
ReadMeFile=	$(SourceDir)/README

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
ConfigureExtra += --static
endif

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
ConfigureExtra += --static
endif

define test_hook
$(BinDir)/idn --version | grep $(Version)
endef
