# Common Crypto for Python
# http://code.google.com/p/pycommoncrypto/
# BSD

include ../../Library/Rules.mk

TITLE=		PyCommonCrypto $(VERSION)
NAME=		pycommoncrypto
VERSION=	0.9.1
REVISION=	0
URL=		http://pycommoncrypto.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar xvf $(SOURCE)
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
	strip -x $(INSTALLDIR)/$(SITEPACKAGES)/*.so
	touch install

test: install
	touch test
