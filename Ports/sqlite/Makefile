include ../../Library/GNU.mk

Title=		SQLite
Name=		sqlite
Version=	3.8.10.2
Revision=	0
Site=		http://www.sqlite.org/
Source=		http://www.sqlite.org/2015/sqlite-autoconf-3081002.tar.gz
Checksum=	c2f2c17d3dc4c4e179d35cc04e4420636d48a152
License=	Public Domain

LicenseFile=	$(SourceDir)/INSTALL

UncompressedName = sqlite-autoconf-3081002

define test_inner_hook
$(BinDir)/sqlite3 -version | grep $(Version)
endef
