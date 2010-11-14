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

ifdef STATIC_ONLY
CONFIG_OPTS+=	--enable-static=yes --enable-shared=no
else
CONFIG_OPTS+=	--enable-static=yes --enable-shared=yes
endif

prep: retrieve
	tar zxvf $(SOURCE)
	patch -d $(BUILDDIR)/src < $(PORTDIR)/mach_vm_region.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --enable-shared $(CONFIG_OPTS) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog*,NEWS,README} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	cd $(BUILDDIR) ; make check
	touch test
