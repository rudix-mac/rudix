include ../../Library/GNU.mk

Title=		SQLite
Name=		sqlite
Version=	3.7.17
AltVersion=	3071700
Revision=	0
Site=		http://www.sqlite.org/
Source=		http://www.sqlite.org/2013/$(Name)-autoconf-$(AltVersion).tar.gz
License=	Public Domain

LicenseFile=	$(SourceDir)/INSTALL

UncompressedName = sqlite-autoconf-$(AltVersion)

define test_inner_hook
$(BinDir)/sqlite3 -version
endef
