# Small, fast s-expression library
# http://sexpr.sourceforge.net/
# LGPL

NAME=		sexpr
VERSION=	1.2
REVISION=	1
URL=		http://downloads.sourceforge.net/sexpr
SOURCE=		$(NAME)_$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	mv $(NAME)_$(VERSION) $(NAME)-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) ; \
	$(make) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/include/sexpr
	install -m 644 $(BUILDDIR)/src/*.h $(INSTALLDIR)/usr/local/include/sexpr
	install -d $(INSTALLDIR)/usr/local/lib
	install -m 644 $(BUILDDIR)/src/libsexp.a $(INSTALLDIR)/usr/local/lib
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE*,README.txt,state_machine.txt} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	touch test
