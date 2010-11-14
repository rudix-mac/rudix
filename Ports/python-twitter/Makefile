# Python Twitter
# http://code.google.com/p/python-twitter/
# Apache

include ../../Library/Rules.mk

TITLE=		Python Twitter $(VERSION)
NAME=		python-twitter
VERSION=	0.6
REVISION=	0
URL=		http://python-twitter.googlecode.com/files
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
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,LICENSE,NOTICE,PKG-INFO,README,doc/twitter.html} $(INSTALLDOCDIR)
	touch install

test: install
	touch test
