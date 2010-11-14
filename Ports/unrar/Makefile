# http://www.rarlab.com/
# Freeware

include ../../Library/Rules.mk

TITLE=		unRAR $(VERSION)
NAME=		unrar
VERSION=	3.7.8
REVISION=	5
URL=		http://www.rarlab.com/rar/
SOURCE=		$(NAME)src-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	mv unrar $(NAME)-$(VERSION)
	install -m 644 $(PORTDIR)/makefile.macosx $(BUILDDIR)/Makefile
	touch prep

build: prep
	cd $(BUILDDIR) ; $(make) CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(CFLAGS)"
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/unrar $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{license.txt,readme.txt} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
