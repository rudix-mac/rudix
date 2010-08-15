# xmlto is a shell-script tool for converting XML files to various formats
# http://www.methods.co.nz/asciidoc/
# GPL

include ../../Library/Rules.mk

TITLE=		xmlto $(VERSION)
NAME=		xmlto
VERSION=	0.0.23
REVISION=	0
URL=		https://fedorahosted.org/releases/x/m/xmlto
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" GETOPT=/usr/local/bin/getopt \
	$(configure) --disable-dependency-tracking ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS*,CHANGELOG*,COPY*,README*} $(INSTALLDOCDIR)

test: install
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
