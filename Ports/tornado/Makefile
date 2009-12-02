# Scalable, non-blocking web server 
# http://python.org/
# Python

include ../../Library/Rules.mk

TITLE=		Tornado $(VERSION)
NAME=		tornado
VERSION=	0.2
REVISION=	0
URL=		http://www.tornadoweb.org/static
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
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
	install -m 644 $(BUILDDIR)/{PKG-INFO,README} $(INSTALLDOCDIR)
	cp -a $(BUILDDIR)/demos $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
