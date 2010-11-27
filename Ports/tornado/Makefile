# Scalable, non-blocking web server 
# http://www.tornadoweb.org/
# Python License

include ../../Library/Rules.mk

TITLE=		Tornado $(VERSION)
NAME=		tornado
VERSION=	1.1
REVISION=	0
URL=		http://github.com/downloads/facebook/tornado
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(PORTDIR)/LICENSE-2.0

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
	install -m 644 $(BUILDDIR)/{PKG-INFO,README} $(INSTALLDOCDIR)
	cp -a $(BUILDDIR)/demos $(INSTALLDOCDIR)
	touch install

test: install
	touch test
