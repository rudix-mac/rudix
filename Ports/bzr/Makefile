include ../../Library/Rules.mk

# Distributed version control system
# http://bazaar-vcs.org/
# GPL

TITLE=		Bazaar $(VERSION)
NAME=		bzr
VERSION=	1.17
REVISION=	0
URL=		http://launchpad.net/bzr/1.17/1.17/+download
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

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
	strip -x -S  $(INSTALLDIR)/$(SITEPACKAGES)/bzrlib/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/bzrlib/*.so"
	$(TOUCH) test
