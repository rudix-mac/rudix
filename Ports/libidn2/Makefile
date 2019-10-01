include ../../Library/GNU.mk

Title=		GNU IDN Library
Name=		libidn2
Version=	2.0.5
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/libidn/$(Name)-$(Version).tar.gz
License=	GPL+LGPL
ReadMeFile=	$(SourceDir)/README.md

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
ConfigureExtra += --static
endif

define test_hook
$(BinDir)/idn --version | grep $(Version)
endef
