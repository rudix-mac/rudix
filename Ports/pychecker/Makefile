# Python codes checker 
# http://pychecker.sourceforge.net/
# BSD

include ../../Library/Rules.mk

TITLE=		PyChecker $(VERSION)
NAME=		pychecker
VERSION=	0.8.18
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	cd $(BUILDDIR) ; tar xvf $(SOURCE)
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
	install -d $(INSTALLDIR)/usr/local/share/doc/$(NAME)
	install -m 644 $(BUILDDIR)/{COPYRIGHT,ChangeLog,KNOWN_BUGS,MAINTAINERS,NEWS,README,TODO,VERSION} $(INSTALLDIR)/usr/local/share/doc/$(NAME)
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; ./test_check.sh
	$(TOUCH) test
