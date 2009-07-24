# $Id: Makefile,v 1.3 2009/05/04 02:32:17 ruda Exp $

# Fast, lightweight source control management
# http://www.selenic.com/mercurial/

NAME=		mercurial
VERSION=	1.2.1
REVISION=	0
URL=		http://www.selenic.com/mercurial/release/
SOURCE=		$(NAME)-$(VERSION).tar.gz

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
		--no-compile \
		--home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES) ; \
	make install-doc PREFIX="$(INSTALLDIR)/usr/local"
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CONTRIBUTORS,COPYING,README} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/mercurial/*.so
	$(TOUCH) install

test: install
	cd $(BUILDDIR)/tests ; $(PYTHON) run-tests.py
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/mercurial/*.so"
	$(TOUCH) test
