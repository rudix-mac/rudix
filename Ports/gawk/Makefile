# GNU awk
# http://www.gnu.org/software/gawk/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU AWK $(VERSION)
NAME=		gawk
VERSION=	3.1.8
REVISION=	0
URL=		http://ftp.gnu.org/gnu/gawk/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
CONFIGURE_OPTS+=	--disable-nls
else
CONFIGURE_OPTS+=	--enable-nls
DEPENDS+=		/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=		-framework CoreFoundation -liconv
endif

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) --disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,FUTURES,LIMITATIONS,NEWS,POSIX.STD,PROBLEMS,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/libexec/awk/*cat
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/libexec/awk/*cat) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
