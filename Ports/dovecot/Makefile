include ../../Library/GNU.mk

Title=		Dovecot (Secure IMAP server)
Name=		dovecot
Version=	2.2.13
Revision=	0
Site=		http://dovecot.org/
URL=		http://dovecot.org/releases/2.2
Source=		$(Name)-$(Version).tar.gz
License=	MIT+LGPL

define test_inner_hook
sudo $(SBinDir)/dovecot -c tests/dovecot.conf
endef
