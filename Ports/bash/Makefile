# GNU Bourne Again Shell
# http://www.gnu.org/software/bash/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Bash $(VERSION)
NAME=		bash
VERSION=	4.1
REVISION=	0
URL=		http://ftp.gnu.org/gnu/bash/
SOURCE=		bash-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR)/builtins ; patch < $(PORTDIR)/universal-build.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf bash bash4
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf bash.1 bash4.1
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,CHANGES,COMPAT,COPYING,NEWS,NOTES,POSIX,RBASH,README,Y2K} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/bash
	$(TOUCH) install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/bash -verify_arch i386 x86_64
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
