include ../../Library/GNU.mk

Title=		SQLite
Name=		sqlite
Version=	3.7.17
AltVersion=	3071700
Revision=	0
URL=		http://www.sqlite.org/2013
Source=		$(Name)-autoconf-$(AltVersion).tar.gz

LicenseFile=	$(SourceDir)/INSTALL

UncompressedName = sqlite-autoconf-$(AltVersion)

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

define test_inner_hook
$(BinDir)/sqlite3 -version
endef
