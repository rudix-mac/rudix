# $Id: Makefile,v 1.1 2009/07/24 00:55:36 ruda Exp $

# Twisted Python
# http://twistedmatrix.com/trac/
# License

NAME=		twisted
VERSION=	8.2.0
REVISION=	0
URL=		http://tmrc.mit.edu/mirror/twisted/Twisted/8.2
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/$(SITEPACKAGES)
	cd $(BUILDDIR) ; env PYTHONPATH="$(INSTALLDIR)/$(SITEPACKAGES)" $(PYTHON) setup.py install \
		--no-compile \
                --home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/*.egg/twisted/*/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/*.egg/twisted/*/*.so"
	$(TOUCH) test
