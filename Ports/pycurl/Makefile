# Python interface to cURL library
# http://pycurl.sourceforge.net/
# LGPL or MIT

include ../../Library/Rules.mk

TITLE=		PycURL $(VERSION)
NAME=		pycurl
VERSION=	7.19.0
REVISION=	0
URL=		http://pycurl.sourceforge.net/download/
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
	patch -d $(BUILDDIR) < $(PORTDIR)/setup.py.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--no-compile \
                --root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/*.so
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	$(TOUCH) test
