# The Django framework
# http://www.djangoproject.com/
# BSD

include ../../Library/Rules.mk

TITLE=		Django $(VERSION)
NAME=		django
VERSION=	1.2.1
REVISION=	0
URL=		http://media.djangoproject.com/releases/1.2/Django-$(VERSION).tar.gz
SOURCE=		Django-$(VERSION).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

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
		--root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,LICENSE,README} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
