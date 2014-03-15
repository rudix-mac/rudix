# Initial packaging by Caio Begotti <http://caio.ueberalles.net>

include ../../Library/Python.mk

Title=		Offline IMAP
Name=		offlineimap
Version=	6.5.5
Revision=	0
Site=		http://offlineimap.org/
URL=		https://github.com/OfflineIMAP/offlineimap/archive
Source=		v$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README.md

define test_inner_hook
$(BinDir)/offlineimap --version | grep $(Version)
endef
