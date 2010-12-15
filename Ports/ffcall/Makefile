# Foreign function call libraries
# http://www.gnu.org/software/libffcall/
# GPL

NAME=		ffcall
VERSION=	1.10
REVISION=	2
URL=		http://www.haible.de/bruno/gnu/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

# FIXME: Can't build in x86-64 machine
build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; make
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/share/doc
	cd $(BUILDDIR) ; make \
		DESTDIR=$(INSTALLDIR) \
		htmldir=/usr/local/share/doc/ffcall install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/NEWS $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	cd $(BUILDDIR) ; make check
	touch test
