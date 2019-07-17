BuildRequires += $(LibDir)/libpcre.la # pcre

include ../../Library/GNU.mk

Title=		SWIG
Name=		swig
Version=	2.0.12
Site=		http://www.swig.org/
Source=		http://sourceforge.net/projects/swig/files/swig/swig-$(Version)/$(Name)-$(Version).tar.gz
License=	GPL

LicenseFile=	$(SourceDir)/LICENSE

GnuConfigureExtra += --disable-ccache # due configure error

define test_hook
$(BinDir)/swig -version | grep $(Version)
endef
