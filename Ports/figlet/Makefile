# Generates ASCII banner art
# http://www.figlet.org/
# The Academic Free License

include ../../Library/Rules.mk

NAME=		figlet
VERSION=	2.2.4
REVISION=	0
URL=		ftp://ftp.figlet.org/pub/figlet/program/unix/
SOURCE=		$(NAME)224.tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	mv $(NAME)222 $(NAME)-$(VERSION)
	patch -d $(BUILDDIR) < $(PORTDIR)/figlet-2.2.2-Makefile.patch
	touch prep

build: prep
	cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDIR)/usr/local/share/man/man6
	cd $(BUILDDIR) ; make \
		DESTDIR=$(INSTALLDIR)/usr/local/bin \
		MANDIR=$(INSTALLDIR)/usr/local/share/man/man6 \
		DEFAULTFONTDIR=$(INSTALLDIR)/usr/local/share/figlet install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,FAQ,LICENSE,README} $(INSTALLDOCDIR)
	chmod +w $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
