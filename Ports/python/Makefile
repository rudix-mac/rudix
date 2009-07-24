# $Id: Makefile,v 1.3 2009/07/24 00:55:36 ruda Exp $

# Interpreted object-oriented programming language
# http://www.python.org/
# Python License

NAME=		Python
VERSION=	3.1
REVISION=	0
URL=		http://www.python.org/ftp/python/3.1/
SOURCE=		Python-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	#mv Python-$(VERSION) $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) \
		--enable-universalsdk --enable-framework ; $(make)
	$(TOUCH) build

install: build
	mkdir -p $(INSTALLDIR)
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE,README,Grammar/Grammar} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/Library/Frameworks/Python.framework/Versions/3.1/bin/*
	strip -x -S $(INSTALLDIR)/Library/Frameworks/Python.framework/Versions/3.0/lib/python3.0/lib-dynload/*.so
	$(TOUCH) install

test: install
	#cd $(BUILDDIR) ; make test
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/python*"
	$(test-universal-binary) "$(INSTALLDIR)/Library/Frameworks/Python.framework/Versions/3.1/lib/python3.1/lib-dynload/*.so"
	$(TOUCH) test
