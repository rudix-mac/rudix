# tmux is a terminal multiplexer
# http://tmux.sourceforge.net/
# BSD

include ../../Library/Rules.mk

TITLE=		Terminal multiplexer $(VERSION)
NAME=		tmux
VERSION=	1.4
REVISION=	0
URL=		http://downloads.sourceforge.net/tmux/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/NOTES
LICENSE=	$(PORTDIR)/LICENSE

prep: retrieve
	tar zxf $(SOURCE)
	patch -d $(BUILDDIR) < $(PORTDIR)/GNumakefile.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure ; $(make) -f GNUmakefile FUNIVERSAL=1
	touch build

install: build
	cd $(BUILDDIR) ; make -f GNUmakefile DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,FAQ,TODO} $(INSTALLDOCDIR)
	chmod +w $(INSTALLDIR)/usr/local/bin/tmux
	strip $(INSTALLDIR)/usr/local/bin/tmux
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
