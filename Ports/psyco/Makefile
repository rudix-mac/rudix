# Extension module to speed up the execution of Python code
# http://psyco.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		Psyco $(VERSION)
NAME=		psyco
VERSION=	1.6
REVISION=	6
URL=		http://downloads.sourceforge.net/psyco/
SOURCE=		$(NAME)-$(VERSION)-src.tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; export ARCHFLAGS="" ; $(PYTHON) setup.py build
	touch build

install: build
	cd $(BUILDDIR) ; \
	$(PYTHON) setup.py install \
		--no-compile \
		--root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING.txt,README.txt} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/psyco/*.so
	touch install

test: install
	touch test
