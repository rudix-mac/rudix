BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libneon.la # static-neon
BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Apache Subversion
Name=		subversion
Version=	1.7.8
Revision=	0
URL=		http://www.us.apache.org/dist/subversion/
Source=		$(Name)-$(Version).tar.bz2

LicenseFile=	$(SourceDir)/LICENSE

define install_post_hook
mv $(InstallDir)/usr/libexec $(InstallDir)/$(Prefix)/libexec
endef

define test_inner_hook
$(BinDir)/svn --version
endef
