BuildRequires += $(BinDir)/xz # xz

include ../../Library/GNU.mk

Title=		FLAC
Name=		flac
Version=	1.3.1
Site=		http://flac.sourceforge.net/
Source=		http://downloads.xiph.org/releases/flac//$(Name)-$(Version).tar.xz
License=	BSD

LicenseFile=	$(SourceDir)/COPYING.Xiph

define test_hook
$(BinDir)/flac --version
endef
