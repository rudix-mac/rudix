# Multilanguage implementation of ctags
# http://ctags.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		Exuberant Ctags $(VERSION)
NAME=		ctags
VERSION=	5.8
REVISION=	0
URL=		http://prdownloads.sourceforge.net/ctags/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/exuberant-prefix.patch
	touch prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --program-prefix=exuberant- ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; \
	make	prefix=$(INSTALLDIR)/usr/local \
		mandir=$(INSTALLDIR)/usr/local/share/man install
	cd $(INSTALLDIR)/usr/local/bin/ ; \
	ln -sf exuberant-ctags ctags ; ln -sf exuberant-ctags etags
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; \
	ln -sf exuberant-ctags.1 ctags.1 ; ln -sf exuberant-ctags.1 etags.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,FAQ,NEWS,README} $(INSTALLDOCDIR)
	install	-m 644 $(BUILDDIR)/*.html $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
