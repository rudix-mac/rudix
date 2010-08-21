# An event notification library
# http://monkey.org/~provos/libevent/
# BSD

include ../../Library/Rules.mk

TITLE=		libevent $(VERSION)
NAME=		libevent
VERSION=	1.4.14b
REVISION=	0
URL=		http://monkey.org/~provos/
SOURCE=		$(NAME)-$(VERSION)-stable.tar.gz

ifdef STATIC_ONLY
CONFIGURE_OPTS=	--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	mv $(NAME)-$(VERSION)-stable $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS); $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ChangeLog,README} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make verify
	$(TOUCH) test
