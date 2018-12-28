include ../../Library/GNU.mk

Title=		SQLite
Name=		sqlite
Version=	3.26.0
Site=		http://www.sqlite.org/
#Source=		http://www.sqlite.org/2016/sqlite-autoconf-3120200.tar.gz
Source=		https://www.sqlite.org/2018/sqlite-autoconf-3260000.tar.gz
License=	Public Domain

LicenseFile=	$(SourceDir)/INSTALL
ReadMeFile=	$(SourceDir)/README.txt

UncompressedName = sqlite-autoconf-3260000

define test_hook
$(BinDir)/sqlite3 -version | grep $(Version)
endef
