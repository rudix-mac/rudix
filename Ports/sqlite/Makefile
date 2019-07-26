include ../../Library/GNU.mk

Title=		SQLite
Name=		sqlite
Version=	3.29.0
Site=		http://www.sqlite.org/
Source=		https://www.sqlite.org/2019/sqlite-autoconf-3290000.tar.gz
License=	Public Domain

LicenseFile=	$(SourceDir)/INSTALL
ReadMeFile=	$(SourceDir)/README.txt

UncompressedName = sqlite-autoconf-3290000

define test_hook
$(BinDir)/sqlite3 -version | grep $(Version)
endef
