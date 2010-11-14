# Twisted Python
# http://twistedmatrix.com/trac/
# License

include ../../Library/Rules.mk

TITLE=		Twisted Python $(VERSION)
NAME=		twisted
VERSION=	8.2.0
REVISION=	0
URL=		http://tmrc.mit.edu/mirror/twisted/Twisted/8.2
SOURCE=		Twisted-$(VERSION).tar.bz2

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	touch build

install: build
	install -d $(INSTALLDIR)/$(SITEPACKAGES)
	cd $(BUILDDIR) ; env PYTHONPATH="$(INSTALLDIR)/$(SITEPACKAGES)" $(PYTHON) setup.py install \
		--no-compile \
                --home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/*.egg/twisted/*/*.so
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/*.egg/twisted/*/*.so"
	touch test
