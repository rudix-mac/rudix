# Fast, lightweight source control management
# http://mercurial.selenic.com/
# GPL

include ../../Library/Rules.mk

TITLE=		Mercurial $(VERSION)
NAME=		mercurial
VERSION=	1.6.2
REVISION=	0
URL=		http://www.selenic.com/mercurial/release/
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
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
		--install-lib=$(SITEPACKAGES) ; \
	make install-doc PREFIX="$(INSTALLDIR)/usr/local"
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CONTRIBUTORS,COPYING,README} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/$(SITEPACKAGES)/mercurial/*.so
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/mercurial/*.so) ; do \
		lipo  $$x -verify_arch i386 x86_64 ppc7400 ; done
	cd $(BUILDDIR)/tests ; $(PYTHON) run-tests.py
	touch test
