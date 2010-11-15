# Text based document generation
# http://www.methods.co.nz/asciidoc/
# GPL

include ../../Library/Rules.mk

TITLE=		AsciiDoc $(VERSION)
NAME=		asciidoc
VERSION=	8.6.3
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar zxf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure ; make
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS*,CHANGELOG*,COPYRIGHT,README.txt} $(INSTALLDOCDIR)
	mv $(INSTALLDIR)/usr/local/etc/asciidoc/asciidoc.conf \
		$(INSTALLDIR)/usr/local/etc/asciidoc/asciidoc.conf.default
	touch install

test: install
	cd $(BUILDDIR) ; make test
	touch test
