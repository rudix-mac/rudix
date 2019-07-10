BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libneon.la # neon
BuildRequires += $(LibDir)/libintl.la # gettext

include ../../Library/GNU.mk

Title=		Apache Subversion
Name=		subversion
Version=	1.8.13
Site=		http://subversion.apache.org/
Source=		http://www.us.apache.org/dist/subversion/$(Name)-$(Version).tar.bz2
License=	Apache License

LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/svn --version | grep $(Version)
endef
