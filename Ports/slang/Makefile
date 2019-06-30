BuildRequires += $(IncludeDir)/zlib.h # static-zlib
BuildRequires += $(LibDir)/libpcre.la # static-pcre
BuildRequires += $(LibDir)/libpng.la  # static-libpng

include ../../Library/GNU.mk

Title=		S-Lang
Name=		slang
Version=	2.3.2
Site=		http://www.jedsoft.org/slang/
Source=		http://www.jedsoft.org/releases/slang/$(Name)-$(Version).tar.bz2
License=	GPL

define after_install_hook
mv $(InstallDir)$(SysConfDir)/slsh.rc \
	$(InstallDir)$(SysConfDir)/slsh.rc.default
endef

define test_hook
$(BinDir)/slsh --version | grep $(Version)
endef
