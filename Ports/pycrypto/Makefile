# cryptographic tools for Python
# http://www.amk.ca/python/code/crypto.html
# Public Domain?

include ../../Library/Rules.mk

TITLE=		PyCrypto $(VERSION)
NAME=		pycrypto
VERSION=	2.0.1
REVISION=	0
URL=		http://www.amk.ca/files/python/crypto/
SOURCE=		$(NAME)-$(VERSION).tar.gz
DEPENDS=	/usr/local/lib/libgmp.la

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
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ACKS,ChangeLog,LICENSE,README,TODO} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/Crypto/*/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/Crypto/*/*.so"
	cd $(BUILDDIR) ; $(PYTHON) test.py
	$(TOUCH) test
