# Depth-indented directory listing program
# ftp://mama.indstate.edu/linux/tree/
# GPL

include ../../Library/Rules.mk

NAME=		tree
VERSION=	1.5.3
REVISION=	0
URL=		ftp://mama.indstate.edu/linux/tree/
SOURCE=		$(NAME)-$(VERSION).tgz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/Makefile.patch
	cp strverscmp.c $(BUILDDIR)
	touch prep

build: prep
	cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	touch build

install: build
	cd $(BUILDDIR) ; \
	make prefix=$(INSTALLDIR)/usr/local \
		MANDIR=$(INSTALLDIR)/usr/local/share/man/man1 install
	install -d $(INSTALLDOCDIR)
	install -m 644  $(BUILDDIR)/{CHANGES,LICENSE,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
