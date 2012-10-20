BuildRequires += $(LibDir)/libpcre.la

include ../../Library/GNU.mk

Title=		SWIG
Name=		swig
Version=	2.0.7
Revision=	0
URL=		http://sourceforge.net/projects/swig/files/swig/swig-$(Version)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

GnuConfigureExtra += --disable-ccache # due configure error

define test_inner_hook
$(BinDir)/swig -version
endef
