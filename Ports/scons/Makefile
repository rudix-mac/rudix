# Python-based build system
# http://www.scons.org/
# BSD

NAME=		scons
VERSION=	1.2.0.d20090223
REVISION=	0
URL=		$(SOURCEFORGE)scons
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; $(PYTHON) setup.py install \
		--no-compile \
		--home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES.txt,LICENSE.txt,README.txt,RELEASE.txt} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
