# Convenient and transparent local/remote incremental mirror/backup
# http://rdiff-backup.nongnu.org/
# GPL

include ../../Library/Rules.mk

NAME=		rdiff-backup
VERSION=	1.2.8
REVISION=	1
URL=		http://savannah.nongnu.org/download/rdiff-backup/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/lib/librsync.la

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env LIBRSYNC_DIR=/usr/local $(PYTHON) setup.py build
	touch build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--no-compile \
		--root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	rm -rf $(INSTALLDIR)/usr/local/share/doc/$(NAME)-$(VERSION)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGELOG,COPYING,FAQ.html,README,examples.html} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/$(SITEPACKAGES)/rdiff_backup/*.so
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/rdiff_backup/*.so"
	touch test
