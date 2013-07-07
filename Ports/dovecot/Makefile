include ../../Library/GNU.mk

Title=		Dovecot (Secure IMAP server)
Name=		dovecot
Version=	2.1.7
Revision=	1
URL=		http://dovecot.org/releases/2.1/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
sudo $(SBinDir)/dovecot -c tests/dovecot.conf
endef
