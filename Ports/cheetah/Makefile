# $Id: Makefile,v 1.2 2009/03/05 02:18:58 ruda Exp $

# Python-powered template engine and code generator
# http://www.cheetahtemplate.org/
#

NAME=		cheetah
VERSION=	2.0.1
REVISION=	4
URL=		$(SOURCEFORGE)cheetahtemplate
SOURCE=		Cheetah-$(VERSION).tar.gz

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
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
	install -m 644 $(BUILDDIR)/{CHANGES,LICENSE,README,TODO} $(INSTALLDOCDIR)
	$(STRIPLIB) $(INSTALLDIR)/$(SITEPACKAGES)/Cheetah/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/Cheetah/*.so"
	$(TOUCH) test
