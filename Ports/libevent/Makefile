# An event notification library
# http://monkey.org/~provos/libevent/
# BSD

include ../../Library/Rules.mk

TITLE=		libevent $(VERSION)
NAME=		libevent
VERSION=	1.4.14b
REVISION=	1
URL=		http://monkey.org/~provos/
SOURCE=		$(NAME)-$(VERSION)-stable.tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(PORTDIR)/LICENSE

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	mv $(NAME)-$(VERSION)-stable $(NAME)-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS); $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ChangeLog,README} $(INSTALLDOCDIR)
	install -m 644 $(PORTDIR)/LICENSE $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make verify
	touch test
