# cryptographic tools for Python
# http://www.dlitz.net/software/pycrypto/
# Public Domain

include ../../Library/Rules.mk

TITLE=		PyCrypto $(VERSION)
NAME=		pycrypto
VERSION=	2.1.0
REVISION=	0
URL=		http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
SOURCE=		$(NAME)-$(VERSION).tar.gz
DEPENDS=	/usr/local/lib/libgmp.la

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar xvf $(SOURCE)
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
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ACKS,ChangeLog,COPYRIGHT,README,TODO} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/$(SITEPACKAGES)/Crypto/*/*.so
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/Crypto/*/*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; $(PYTHON) setup.py test
	$(TOUCH) test
