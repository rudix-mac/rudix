# Parse command-line arguments from shell scripts
# http://software.frodo.looijaard.name/getopt/
# GPL

include ../../Library/Rules.mk

TITLE=		getopt $(VERSION)
NAME=		getopt
VERSION=	1.1.4
REVISION=	0
URL=		http://software.frodo.looijaard.name/getopt/files
SOURCE=		$(NAME)-$(VERSION).tar.gz

# FIXME: should compile dynamic too
LDFLAGS+=	-framework CoreFoundation -liconv -lintl

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	$(make) LIBCGETOPT=0 CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	touch build

install: build
	cd $(BUILDDIR) ; \
	make DESTDIR=$(INSTALLDIR) mandir=/usr/local/share/man install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,README,TODO} $(INSTALLDOCDIR)

test: install
	cd $(BUILDDIR) ; make test
	touch test
