# Python-powered template engine and code generator
# http://www.cheetahtemplate.org/

include ../../Library/Rules.mk

TITLE=		Cheetah $(VERSION)
NAME=		cheetah
VERSION=	2.2.1
REVISION=	0
URL=		$(SOURCEFORGE)cheetahtemplate
SOURCE=		Cheetah-$(VERSION).tar.gz

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
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,LICENSE,README,TODO} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/Cheetah/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/Cheetah/*.so"
	$(TOUCH) test
