include ../../Library/GNU.mk

Title=		Apache Subversion
Name=		subversion
Version=	1.14.0
Site=		https://subversion.apache.org/
Source=		https://downloads.apache.org/subversion/subversion-$(Version).tar.bz2
License=	Apache License
LicenseFile=	$(SourceDir)/LICENSE

BuildRequires += $(BinDir)/pkg-config	# pkg-config
BuildRequires += $(LibDir)/libneon.la	# neon
BuildRequires += $(LibDir)/libintl.la	# gettext
BuildRequires += $(BinDir)/apr-1-config	# static-apr
BuildRequires += $(BinDir)/apu-1-config	# apr-util

GnuConfigureExtra += --with-lz4=internal
GnuConfigureExtra += --with-utf8proc=internal

define test_hook
$(BinDir)/svn --version | grep $(Version)
endef
