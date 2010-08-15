# Text based document generation
# http://www.methods.co.nz/asciidoc/
# GPL

include ../../Library/Rules.mk

TITLE=		AsciiDoc $(VERSION)
NAME=		asciidoc
VERSION=	8.5.3
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/asciidoc/asciidoc.conf \
		$(INSTALLDIR)/usr/local/etc/asciidoc/asciidoc.conf.orig
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS*,CHANGELOG*,COPY*,README*} $(INSTALLDOCDIR)

test: install
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
