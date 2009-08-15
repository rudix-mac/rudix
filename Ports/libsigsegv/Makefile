# Library for handling page faults in user mode
# http://libsigsegv.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU libsigsegv $(VERSION)
NAME=		libsigsegv
VERSION=	2.7
REVISION=	0
URL=		http://ftp.gnu.org/gnu/libsigsegv/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--enable-shared ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog*,NEWS,README} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
