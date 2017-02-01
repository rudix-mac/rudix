include ../../Library/GNU.mk

Title=		SQLite
Name=		sqlite
Version=	3.12.2
Site=		http://www.sqlite.org/
Source=		http://www.sqlite.org/2016/sqlite-autoconf-3120200.tar.gz
License=	Public Domain

LicenseFile=	$(SourceDir)/INSTALL
ReadMeFile=	$(SourceDir)/README.txt

UncompressedName = sqlite-autoconf-3120200

define test_inner_hook
$(BinDir)/sqlite3 -version | grep $(Version)
endef
