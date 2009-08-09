# GNU Bourne Again Shell
# http://www.gnu.org/software/bash/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Bash $(VERSION)
NAME=		bash
VERSION=	4.0
REVISION=	1
URL=		http://ftp.gnu.org/gnu/bash/
SOURCE=		bash-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR)/builtins ; patch < $(PORTDIR)/universal-build.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,CHANGES,COMPAT,COPYING,NEWS,NOTES,POSIX,RBASH,README,Y2K} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/bash
	$(TOUCH) install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/bash -verify_arch i386 ppc7400
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
