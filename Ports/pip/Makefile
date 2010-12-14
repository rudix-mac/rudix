# pip installs packages. Python packages. An easy_install replacement
# http://pypi.python.org/pypi/pip
# Python

include ../../Library/Rules.mk

TITLE=		pip $(VERSION)
NAME=		pip
VERSION=	0.8.2
REVISION=	0
URL=		http://pypi.python.org/packages/source/p/pip/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/docs/index.txt
LICENSE=	$(BUILDDIR)/docs/license.txt

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
	touch install

test: install
	touch test
