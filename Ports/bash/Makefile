# GNU Bourne Again Shell
# http://www.gnu.org/software/bash/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Bash $(VERSION)
NAME=		bash
VERSION=	4.1
REVISION=	1
URL=		http://ftp.gnu.org/gnu/bash/
SOURCE=		bash-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar zxvf $(SOURCE)
	patch -d $(BUILDDIR)/builtins < $(PORTDIR)/universal-build.patch
	for x in $(PORTDIR)/patches/* ; do \
		patch -d $(BUILDDIR) -p0 < $$x ; done
	touch prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf bash bash4
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf bash.1 bash4.1
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,CHANGES,COMPAT,NEWS,NOTES,POSIX,RBASH,Y2K} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/bash
	touch install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/bash -verify_arch i386 x86_64
	cd $(BUILDDIR) ; make test
	touch test
