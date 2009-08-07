# Extension module to speed up the execution of Python code
# http://psyco.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		Psyco $(VERSION)
NAME=		psyco
VERSION=	1.6
REVISION=	5
URL=		$(SOURCEFORGE)psyco
SOURCE=		$(NAME)-$(VERSION)-src.tar.gz

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
	install -m 644 $(BUILDDIR)/{COPYING.txt,README.txt} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/psyco/*.so
	$(TOUCH) install

test: install
	$(TOUCH) test
