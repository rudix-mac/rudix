# The iPython framework
# http://www.ipythonproject.com/
# BSD

# Packager: Osvaldo Santana <osantana@gmail.com>

include ../../Library/Rules.mk

TITLE=		iPython $(VERSION)
NAME=		ipython
VERSION=	0.10
REVISION=	0
URL=		http://ipython.scipy.org/dist/0.10/
SOURCE=		ipython-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--no-compile \
		--home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/README.txt $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
