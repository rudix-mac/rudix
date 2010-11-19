# Distributed version control system
# http://bazaar-vcs.org/
# GPL

include ../../Library/Rules.mk

TITLE=		Bazaar $(VERSION)
NAME=		bzr
VERSION=	2.2.1
REVISION=	0
URL=		http://launchpad.net/bzr/2.2/$(VERSION)/+download/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING.txt

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/mandir.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	touch build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--no-compile \
		--home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{NEWS,TODO} $(INSTALLDOCDIR)
	rsync -a $(BUILDDIR)/doc/ $(INSTALLDOCDIR)
	strip -x  $(INSTALLDIR)/$(SITEPACKAGES)/bzrlib/*.so
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/bzrlib/*.so) ; do \
		lipo  $$x -verify_arch i386 x86_64 ppc7400 ; done
	touch test
