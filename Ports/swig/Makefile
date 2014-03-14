BuildRequires += $(LibDir)/libpcre.la # static-pcre

include ../../Library/GNU.mk

Title=		SWIG
Name=		swig
Version=	2.0.12
Revision=	0
Site=		http://www.swig.org/
URL=		http://sourceforge.net/projects/swig/files/swig/swig-$(Version)
Source=		$(Name)-$(Version).tar.gz
License=	GPL

LicenseFile=	$(SourceDir)/LICENSE

GnuConfigureExtra += --disable-ccache # due configure error

define test_inner_hook
$(BinDir)/swig -version | grep $(Version)
endef
