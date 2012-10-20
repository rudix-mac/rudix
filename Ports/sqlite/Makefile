include ../../Library/GNU.mk

Title=		SQLite
Name=		sqlite
Version=	3.7.13
AltVersion=	3071300
Revision=	0
URL=		http://www.sqlite.org/
Source=		$(Name)-autoconf-$(AltVersion).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/INSTALL

UncompressedName = sqlite-autoconf-$(AltVersion)

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

define test_inner_hook
$(BinDir)/sqlite3 -version
endef
