include ../../Library/GNU.mk

Title=		XZ Utils
Name=		xz
Version=	5.0.3
Revision=	2
URL=		http://tukaani.org/xz/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define test_inner_hook
$(BinDir)/xz --version
endef
