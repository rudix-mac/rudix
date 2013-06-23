BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libneon.la # static-neon
BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Apache Subversion
Name=		subversion
Version=	1.8.0
Revision=	0
URL=		http://www.us.apache.org/dist/subversion/
Source=		$(Name)-$(Version).tar.bz2

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/svn --version
endef
