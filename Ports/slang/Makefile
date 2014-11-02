BuildRequires += $(IncludeDir)/zlib.h # static-zlib
BuildRequires += $(LibDir)/libpcre.la # static-pcre
BuildRequires += $(LibDir)/libpng.la  # static-libpng

include ../../Library/GNU.mk

Title=		S-Lang
Name=		slang
Version=	2.3.0
Revision=	0
Site=		http://www.jedsoft.org/slang/
URL=		http://www.jedsoft.org/releases/slang
Source=		$(Name)-$(Version).tar.bz2
Checksum=	6e26e90307d4569e5feef195648c0858ba27f7ac
License=	GPL

ifneq ($(RUDIX_BUILD_STATIC_LIBS),yes)
define install_post_hook
mv $(InstallDir)$(SysConfDir)/slsh.rc \
	$(InstallDir)$(SysConfDir)/slsh.rc.default
endef

define test_inner_hook
$(BinDir)/slsh --version | grep $(Version)
endef
endif

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
MakeExtra=static
MakeInstallExtra=install-static
define make_install
$(MAKE) install-static
endef
endif
