# web.py is a web framework for python that is as simple as it is powerful
# http://webpy.org/
# Public Domain

include ../../Library/Rules.mk

TITLE=		web.py $(VERSION)
NAME=		web.py
VERSION=	0.33
REVISION=	0
URL=		http://webpy.org/static/
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
	cd $(BUILDDIR) ; $(PYTHON) setup.py install \
		--no-compile \
		--root=$(INSTALLDIR)
		--prefix=/usr/local
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
