# Python Game Development
# http://www.pygame.org/
# LGPL

NAME=		pygame
VERSION=	1.9.1
REVISION=	0
URL=		http://www.pygame.org/ftp/
SOURCE=		$(NAME)-$(VERSION)release.tar.gz

include ../../Library/Rules.mk

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar zxvf $(SOURCE)
	mv $(NAME)-$(VERSION)release $(NAME)-$(VERSION)
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
	strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/*/*.so"
	touch test
