# Fast, multi-threaded malloc() and nifty performance analysis tools
# http://code.google.com/p/google-perftools/
# BSD

NAME=		google-perftools
VERSION=	1.1
URL=		http://google-perftools.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar -zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env MACOSX_DEPLOYMENT_TARGET=10.3 \
		CXXFLAGS="$(CXXFLAGS)" $(configure) \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/share/doc/$(NAME)-$(VERSION) \
		$(INSTALLDIR)/usr/local/share/doc/$(NAME)
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test
