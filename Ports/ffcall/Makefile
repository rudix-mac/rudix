# Foreign function call libraries
# http://www.gnu.org/software/libffcall/
# GPL

NAME=		ffcall
VERSION=	1.10
REVISION=	1
URL=		http://www.haible.de/bruno/gnu/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; make
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/share/doc
	cd $(BUILDDIR) ; make \
		DESTDIR=$(INSTALLDIR) \
		htmldir=/usr/local/share/doc/ffcall install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,NEWS,README} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test
