BuildRequires += $(BinDir)/xz # xz

include ../../Library/GNU.mk

Title=		FLAC
Name=		flac
Version=	1.3.1
Revision=	0
Site=		http://flac.sourceforge.net/
URL=		http://downloads.xiph.org/releases/flac/
Source=		$(Name)-$(Version).tar.xz
License=	BSD

LicenseFile=	$(SourceDir)/COPYING.Xiph

define test_inner_hook
$(BinDir)/flac --version
endef
