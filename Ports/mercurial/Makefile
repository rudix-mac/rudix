include ../../Library/Rules.mk

# Fast, lightweight source control management
# http://www.selenic.com/mercurial/

TITLE=		Mercurial $(VERSION)
NAME=		mercurial
VERSION=	1.3.1
REVISION=	0
URL=		http://www.selenic.com/mercurial/release/
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

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
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES) ; \
	make install-doc PREFIX="$(INSTALLDIR)/usr/local"
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CONTRIBUTORS,COPYING,README} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/mercurial/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/mercurial/*.so"
	cd $(BUILDDIR)/tests ; $(PYTHON) run-tests.py
	$(TOUCH) test
