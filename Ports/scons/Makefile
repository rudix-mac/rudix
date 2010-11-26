# Python-based build system
# http://www.scons.org/
# BSD

include ../../Library/Rules.mk

TITLE=		SCons $(VERSION)
NAME=		scons
VERSION=	2.0.1
REVISION=	1
URL=		http://downloads.sourceforge.net/scons
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README.txt
COPYING=	$(BUILDDIR)/LICESNE.txt

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	touch build

install: build
	cd $(BUILDDIR) ; $(PYTHON) setup.py install \
		--no-compile \
		--root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES.txt,LICENSE.txt,README.txt,RELEASE.txt} $(INSTALLDOCDIR)
	touch install

test: install
	touch test
