# Libmemcached wrapper
# http://pypi.python.org/pypi/pylibmc
# Python

include ../../Library/Rules.mk

TITLE=		pylibmc $(VERSION)
NAME=		pylibmc
VERSION=	1.1.1
REVISION=	0
URL=		http://pypi.python.org/packages/source/p/pylibmc/
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

ifdef WITH_STATIC_LIBMEMCACHED
LDFLAGS+=	-lsasl2.2
endif

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env LDFLAGS="$(LDFLAGS)" $(PYTHON) setup.py build
	touch build

install: build
	cd $(BUILDDIR) ; $(PYTHON) setup.py install \
		--no-compile \
		--root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/*.so
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
