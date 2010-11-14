# Multiprecision arithmetic for Python
# http://code.google.com/p/gmpy/
# Python

include ../../Library/Rules.mk

TITLE=		gmpy $(VERSION)
NAME=		gmpy
VERSION=	1.11rc1
REVISION=	0
URL=		http://gmpy.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).zip

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

CFLAGS=		-arch i386
LDFLAGS=	-arch i386
ifdef WITH_STATIC_GMP
LDFLAGS=	-Wl,-read_only_relocs -Wl,suppress
endif

prep: retrieve
	cd $(BUILDDIR) ; unzip $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(PYTHON) setup.py build
	touch build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--no-compile \
                --root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/*.so
	touch install

test: install
	cd $(BUILDDIR) ; $(PYTHON) test/gmpy_test.py
	touch test
