# Python codes checker 
# http://pychecker.sourceforge.net/
# BSD

include ../../Library/Rules.mk

TITLE=		PyChecker $(VERSION)
NAME=		pychecker
VERSION=	0.8.18
REVISION=	2
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYRIGHT

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar xvf $(SOURCE)
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
	install -d $(INSTALLDIR)/usr/local/share/doc/$(NAME)
	install -m 644 $(BUILDDIR)/{COPYRIGHT,ChangeLog,KNOWN_BUGS,MAINTAINERS,NEWS,README,TODO,VERSION} $(INSTALLDIR)/usr/local/share/doc/$(NAME)
	touch install

test: install
	cd $(BUILDDIR) ; ./test_check.sh
	touch test
