BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

Title=		Pipe Viewer
Name=		pv
Version=	1.4.6
Revision=	0
Site=		http://www.ivarch.com/programs/pv.shtml
URL=		http://www.ivarch.com/programs/sources/
Source=		$(Name)-$(Version).tar.bz2
License=	Artistic License

LicenseFile=	$(SourceDir)/doc/COPYING

define test_inner_hook
$(BinDir)/pv --version
endef
