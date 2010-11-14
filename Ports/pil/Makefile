
# Python imaging library
# http://www.pythonware.com/products/pil/
# 

NAME=		Imaging
VERSION=	1.1.6
REVISION=	0
URL=		http://effbot.org/downloads/
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
	touch build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--home=$(INSTALLDIR)/usr/local \
		--install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,README} $(INSTALLDOCDIR)
	rsync -av $(BUILDDIR)/Docs/* $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/PIL/*.so
	touch install

test: install
	touch test
