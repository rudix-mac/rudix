# Initial packaging by Caio Begotti <http://caio.ueberalles.net>

include ../../Library/Python.mk

Title=		Offline IMAP
Name=		offlineimap
Version=	6.5.4
Revision=	0
URL=		https://github.com/downloads/spaetz/offlineimap
Source=		$(Name)-v$(Version).tar.gz


UncompressedName = spaetz-offlineimap-c9e9690

#define prep_post_hook
## http://www.mail-archive.com/fink-users@lists.sourceforge.net/msg31539.html
#/usr/bin/sed -i -e 's/^from/import locale; from/' $(Name)/bin/offlineimap
#endef
