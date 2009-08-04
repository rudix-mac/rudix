# Indenter and formatter of C/C++/Java source files
# http://astyle.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		Artistic Style $(VERSION)
NAME=		astyle
VERSION=	1.23
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)_$(VERSION)_macosx.tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	mv $(NAME) $(NAME)-$(VERSION)
	cd $(BUILDDIR)/buildmac ; patch < $(PORTDIR)/makefile.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR)/buildmac ; $(make) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/bin/astyle $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/* $(INSTALLDOCDIR)
	$(TOUCH) install

test: build
	lipo $(INSTALLDIR)/usr/local/bin/astyle -verify_arch i386 ppc7400
	$(TOUCH) test
