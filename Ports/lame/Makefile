# Lame ain't an MP3 encoder
# http://lame.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		LAME $(VERSION)
NAME=		lame
VERSION=	3.98.2
REVISION=	3
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-398-2.tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	mv lame-398-2 $(NAME)-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking  ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{API,COPYING,LICENSE,README,STYLEGUIDE,TODO,USAGE} $(INSTALLDOCDIR)

	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	touch test
