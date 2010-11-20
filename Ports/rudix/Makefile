# Rudix Package Manager -- RPM ;D
# http://rudix.org/
# BSD

include ../../Library/Rules.mk

TITLE=		Rudix Package Manager $(VERSION)
NAME=		rudix
VERSION=	3.0
REVISION=	0

README=		$(PORTDIR)/ReadMe.txt
LICENSE=	$(PORTDIR)/License.txt

build: rudix.pdf
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/sbin
	sed "s/@VERSION@/$(VERSION)/" $(PORTDIR)/rudix.py > $(INSTALLDIR)/usr/local/sbin/rudix
	chmod 755 $(INSTALLDIR)/usr/local/sbin/rudix
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 rudix.1 $(INSTALLDIR)/usr/local/share/man/man1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 rudix.pdf $(INSTALLDOCDIR)
	touch install

test: install
	touch test

rudix.pdf: rudix.1
	groff -mandoc rudix.1 > rudix.ps
	pstopdf rudix.ps -o rudix.pdf
