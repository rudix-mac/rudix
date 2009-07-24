# Python bindings for libxml2
# http://xmlsoft.org/python.html
# XXX

NAME=		libxml2-python
VERSION=	2.6.9
REVISION=	0
URL=		ftp://xmlsoft.org/libxml2/python/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
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
	install -m 644 $(BUILDDIR)/{README,TODO,*.xml,*.txt} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/*.so"
	$(TOUCH) test
