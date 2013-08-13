BuildRequires += $(BinDir)/xz # xz

include ../../Library/GNU.mk

Title=		FLAC
Name=		flac
Version=	1.3.0
Revision=	0
URL=		http://downloads.xiph.org/releases/flac/
Source=		$(Name)-$(Version).tar.xz

LicenseFile=	$(SourceDir)/COPYING.Xiph

define test_inner_hook
$(BinDir)/flac --version
endef
