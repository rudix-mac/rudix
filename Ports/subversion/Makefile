BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libneon.la
BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		Apache Subversion
Name=		subversion
Version=	1.7.6
Revision=	0
URL=		http://ftp.unicamp.br/pub/apache/subversion/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

define install_post_hook
mv $(InstallDir)/usr/libexec $(InstallDir)/$(Prefix)/libexec
endef

define test_inner_hook
$(BinDir)/svn --version
endef
