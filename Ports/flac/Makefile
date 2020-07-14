BuildRequires += $(BinDir)/xz # xz

include ../../Library/GNU.mk

Title=		FLAC
Name=		flac
Version=	1.3.3
Site=		https://xiph.org/flac/
Source=		http://downloads.xiph.org/releases/flac/$(Name)-$(Version).tar.xz
License=	BSD

LicenseFile=	$(SourceDir)/COPYING.Xiph
GnuConfigureExtra += --disable-ogg

define test_hook
$(BinDir)/flac --version
endef
