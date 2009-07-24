# $Id: Makefile,v 1.2 2009/03/21 21:56:53 ruda Exp $

HOMEPAGE=	http://p7zip.sourceforge.net/

NAME=		p7zip
VERSION=	4.65
REVISION=	0
URL=		$(SOURCEFORGE)p7zip
SOURCE=		$(NAME)_$(VERSION)_src_all.tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	mv $(NAME)_$(VERSION) $(NAME)-$(VERSION)
	cd $(BUILDDIR) ; cp makefile.macosx makefile.machine
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; $(make) OPTFLAGS="$(CXXFLAGS)" all3
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)
	cd $(BUILDDIR) ; \
	./install.sh /usr/local/bin \
		/usr/local/lib/p7zip \
		/usr/local/share/man \
		/usr/local/share/doc/p7zip $(INSTALLDIR)
	chmod u+w $(INSTALLDIR)/usr/local/lib/p7zip/7z*
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{README,TODO} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/p7zip/7z*
	chmod +w $(INSTALLDIR)/usr/local/lib/p7zip/Codecs/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/p7zip/Codecs/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/p7zip/7z*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/p7zip/Codecs/*"
	$(TOUCH) test
