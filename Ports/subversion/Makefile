BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libneon.la # static-neon
BuildRequires += $(LibDir)/libintl.la # static-gettext
ifeq ($(OSXVersion),10.6)
BuildRequires += $(LibDir)/libsqlite3.la # static-sqlite
endif

include ../../Library/GNU.mk

Title=		Apache Subversion
Name=		subversion
Version=	1.8.13
Site=		http://subversion.apache.org/
Source=		http://www.us.apache.org/dist/subversion/$(Name)-$(Version).tar.bz2
License=	Apache License

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/svn --version | grep $(Version)
endef
