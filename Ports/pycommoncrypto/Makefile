# $Id: Makefile.Python,v 1.1 2009/05/03 14:35:03 ruda Exp $

# Common Crypto for Python
# http://code.google.com/p/pycommoncrypto/
# BSD

NAME=		pycommoncrypto
VERSION=	0.2
REVISION=	0
URL=		http://pycommoncrypto.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar xvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; $(PYTHON) setup.py install \
		--no-compile \
                --home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/*.so
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; $(PYTHON) CC.py
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/*.so"
	$(TOUCH) test
