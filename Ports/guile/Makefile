# GNU's Ubiquitous Intelligent Language for Extension
# http://www.gnu.org/software/guile/
# LGPL

include ../../Library/Rules.mk

NAME=		guile
VERSION=	1.8.7
REVISION=	2
URL=		http://ftp.gnu.org/gnu/guile/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
NLS=            --disable-nls
else
NLS=            --enable-nls
DEPENDS+=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

ifdef WITH_STATIC_GMP
# http://www.mail-archive.com/guile-devel@gnu.org/msg03413.html
LDFLAGS=	-Wl,-read_only_relocs -Wl,suppress
endif

prep: retrieve
	tar zxvf $(SOURCE)
	patch -d $(BUILDDIR)/libguile < $(PORTDIR)/libguile-Makefile.in.patch
	patch -d $(BUILDDIR)/guile-readline < $(PORTDIR)/readline-Makefile.in.patch
	patch -d $(BUILDDIR)/guile-readline < $(PORTDIR)/libedit.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env LDFLAGS="$(LDFLAGS)" \
	$(configure) $(NLS) --disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING*,ChangeLog,GUILE-VERSION,HACKING,LICENSE,NEWS,README,THANKS} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
