BuildRequires += $(LibDir)/libpcre.la # static-pcre

include ../../Library/GNU.mk

Title=		SWIG
Name=		swig
Version=	2.0.10
Revision=	0
URL=		http://sourceforge.net/projects/swig/files/swig/swig-$(Version)
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/LICENSE

GnuConfigureExtra += --disable-ccache # due configure error

define test_inner_hook
$(BinDir)/swig -version
endef
