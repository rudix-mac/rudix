# Distributed version control system
# http://bazaar-vcs.org/
# GPL

include ../../Library/Rules.mk

TITLE=		Bazaar $(VERSION)
NAME=		bzr
VERSION=	2.1.0b1
REVISION=	0
URL=		http://launchpad.net/bzr/2.1/2.1.0b1/+download/
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/mandir.patch
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
	install -m 644 $(BUILDDIR)/{COPYING.txt,NEWS,README,TODO} $(INSTALLDOCDIR)
	rsync -a $(BUILDDIR)/doc/ $(INSTALLDOCDIR)
	$(STRIP_LIB)  $(INSTALLDIR)/$(SITEPACKAGES)/bzrlib/*.so
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/bzrlib/*.so) ; do \
		lipo  $$x -verify_arch i386 x86_64 ppc7400 ; done
	$(TOUCH) test
