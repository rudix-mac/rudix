# Python-powered template engine and code generator
# http://www.cheetahtemplate.org/
# BSD/MIT?

include ../../Library/Rules.mk

TITLE=		Cheetah $(VERSION)
NAME=		cheetah
VERSION=	2.4.2.1
REVISION=	0
URL=		http://pypi.python.org/packages/source/C/Cheetah/
SOURCE=		Cheetah-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	touch build

install: build
	#install -d $(INSTALLDIR)/Library/Python/2.6/site-packages/
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--no-compile \
		--root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,LICENSE,README*,TODO} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/$(SITEPACKAGES)/Cheetah/*.so
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/Cheetah/*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
