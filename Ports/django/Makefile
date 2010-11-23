# The Django framework
# http://www.djangoproject.com/
# BSD

include ../../Library/Rules.mk

TITLE=		Django $(VERSION)
NAME=		django
VERSION=	1.2.3
REVISION=	0
URL=		http://media.djangoproject.com/releases/1.2/Django-$(VERSION).tar.gz
SOURCE=		Django-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/LICENSE

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(PYTHON) setup.py build
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
	install -m 644 $(BUILDDIR)/{AUTHORS,LICENSE,README} $(INSTALLDOCDIR)
	touch install

test: install
	touch test
