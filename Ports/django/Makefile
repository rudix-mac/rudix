# $Id: Makefile,v 1.2 2009/03/05 19:39:14 ruda Exp $

# The Django framework
# http://www.djangoproject.com/
# BSD

NAME=		django
VERSION=	1.0.2
REVISION=	0
URL=		http://media.djangoproject.com/releases/$(VERSION)/
SOURCE=		Django-$(VERSION)-final.tar.gz

include ../../Library/Rules.mk

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	mv Django-$(VERSION)-final Django-$(VERSION)
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
	install -m 644 $(BUILDDIR)/{AUTHORS,LICENSE,README} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
