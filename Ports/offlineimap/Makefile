# Initial packaging by Caio Begotti <http://caio.ueberalles.net>

include ../../Library/Python.mk

Title=		Offline IMAP
Name=		offlineimap
Version=	6.4.0
Revision=	0
URL=		https://nodeload.github.com/nicolas33/offlineimap/tarball
Source=		v$(Version)

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = nicolas33-offlineimap-b1bff15

#define prep_post_hook
## http://www.mail-archive.com/fink-users@lists.sourceforge.net/msg31539.html
#/usr/bin/sed -i -e 's/^from/import locale; from/' $(Name)/bin/offlineimap
#endef
