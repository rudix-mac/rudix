# Simple, fast, extensible JSON encoder/decoder for Python
# http://pypi.python.org/pypi/simplejson
# BSD

include ../../Library/Rules.mk

TITLE=		simplejson $(VERSION)
NAME=		simplejson
VERSION=	2.0.9
REVISION=	0
URL=		http://pypi.python.org/packages/source/s/simplejson
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	touch build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--no-compile \
                --root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	strip -x $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE.txt,PKG-INFO} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/docs/{*.html,*.json} $(INSTALLDOCDIR)
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
