# RSS and Atom feeds parser written in Python
# http://www.feedparser.org/

include ../../Library/Rules.mk

TITLE=		Universal Feed Parser $(VERSION)
NAME=		feedparser
VERSION=	4.1
REVISION=	4
URL=		http://feedparser.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).zip

PYTHON=		/usr/bin/python
SITEPACKAGES=	/Library/Python/2.5/site-packages

prep: retrieve
	mkdir -p $(BUILDDIR) ; cd $(BUILDDIR) ; unzip $(PORTDIR)/$(SOURCE)
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
	install -m 644 $(BUILDDIR)/{LICENSE,README} $(INSTALLDOCDIR)
	rsync -av $(BUILDDIR)/docs/* $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
