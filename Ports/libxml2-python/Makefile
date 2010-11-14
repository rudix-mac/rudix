# Python bindings for libxml2
# http://xmlsoft.org/python.html
# MIT

include ../../Library/Rules.mk

NAME=		libxml2-python
VERSION=	2.6.21
REVISION=	0
URL=		ftp://xmlsoft.org/libxml2/python/
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
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{README,TODO,*.xml,*.txt} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/*.so
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
