# $Id: Makefile,v 1.2 2009/03/06 13:33:55 ruda Exp $

# RSS and Atom feeds parser written in Python
# http://www.feedparser.org/

NAME=		feedparser
VERSION=	4.1
REVISION=	4
URL=		http://feedparser.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).zip

include ../../Library/Rules.mk

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	mkdir -p $(BUILDDIR) ; cd $(BUILDDIR) ; unzip $(PORTDIR)/$(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE,README} $(INSTALLDOCDIR)
	rsync -av $(BUILDDIR)/docs/* $(INSTALLDOCDIR)
	$(TOUCH) install
