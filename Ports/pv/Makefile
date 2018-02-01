BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Pipe Viewer
Name=		pv
Version=	1.4.6
Site=		http://www.ivarch.com/programs/pv.shtml
Source=		http://www.ivarch.com/programs/sources//$(Name)-$(Version).tar.bz2
License=	Artistic License

LicenseFile=	$(SourceDir)/doc/COPYING

define test_hook
$(BinDir)/pv --version
endef
