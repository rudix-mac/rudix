# Indenter and formatter of C/C++/Java source files
# http://astyle.sourceforge.net/
# LGPL

include ../../Library/Rules.mk

TITLE=		Artistic Style $(VERSION)
NAME=		astyle
VERSION=	1.24
REVISION=	1
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)_$(VERSION)_macosx.tar.gz

README=		$(BUILDDIR)/doc/index.html
LICENSE=	$(BUILDDIR)/doc/license.html

prep: retrieve
	tar zxvf $(SOURCE)
	mv $(NAME) $(NAME)-$(VERSION)
	patch -d $(BUILDDIR)/build/mac < $(PORTDIR)/makefile.patch
	touch prep

build: prep
	cd $(BUILDDIR)/build/mac ; make CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/build/mac/bin/astyle $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/* $(INSTALLDOCDIR)
	touch install

test: build
	lipo $(INSTALLDIR)/usr/local/bin/astyle -verify_arch i386 x86_64
	touch test
