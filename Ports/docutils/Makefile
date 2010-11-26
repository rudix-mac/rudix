# Documentation Utilities
# http://docutils.sourceforge.net/
# Public Domain

include ../../Library/Rules.mk

TITLE=		Docutils $(VERSION)
NAME=		docutils
VERSION=	0.7
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README.txt
LICENSE=	$(BUILDDIR)/COPYING.txt

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
	install -m 644 $(BUILDDIR)/*.txt $(INSTALLDOCDIR)
	touch install

test: install
	cd $(BUILDDIR)/test ; $(PYTHON) alltests.py
	touch test
