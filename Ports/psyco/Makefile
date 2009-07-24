# $Id: Makefile,v 1.2 2009/03/05 14:16:00 ruda Exp $

# Extension module to speed up the execution of Python code
# http://psyco.sourceforge.net/
# GPL

NAME=		psyco
VERSION=	1.6
REVISION=	5
URL=		$(SOURCEFORGE)psyco
SOURCE=		$(NAME)-$(VERSION)-src.tar.gz

include ../../Library/Rules.mk

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

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
	install -m 644 $(BUILDDIR)/{COPYING.txt,README.txt} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/psyco/*.so
	$(TOUCH) install

test: install
	$(TOUCH) test
