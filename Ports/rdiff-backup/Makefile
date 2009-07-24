# $Id: Makefile,v 1.2 2009/03/21 22:16:22 ruda Exp $

HOMEPAGE=	http://rdiff-backup.nongnu.org/

NAME=		rdiff-backup
VERSION=	1.2.8
REVISION=	0
URL=		http://savannah.nongnu.org/download/rdiff-backup/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

DEPENDS=	/usr/local/lib/librsync.dylib 

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env LIBRSYNC_DIR=/usr/local $(PYTHON) setup.py build
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	rm -rf $(INSTALLDIR)/usr/local/share/doc/$(NAME)-$(VERSION)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGELOG,COPYING,FAQ.html,README,examples.html} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/rdiff_backup/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/rdiff_backup/*.so"
	$(TOUCH) test
