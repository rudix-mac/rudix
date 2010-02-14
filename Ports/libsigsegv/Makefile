# Library for handling page faults in user mode
# http://libsigsegv.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU libsigsegv $(VERSION)
NAME=		libsigsegv
VERSION=	2.8
REVISION=	0
URL=		http://ftp.gnu.org/gnu/libsigsegv/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	patch -d $(BUILDDIR)/src < $(PORTDIR)/mach_vm_region.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --enable-shared ; $(make)
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
