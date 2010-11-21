# GIT - Tree History Storage Tool
# http://git.or.cz/
# GPL

include ../../Library/Rules.mk

NAME=		git
VERSION=	1.7.3.2
REVISION=	0
URL=		http://www.kernel.org/pub/software/scm/git/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

retrieve:
	$(FETCH) $(URL)/$(SOURCE)
	$(FETCH) $(URL)/git-manpages-$(VERSION).tar.bz2
	touch retrieve

prep: retrieve
	tar jxf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/Makefile.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make configure ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install #install-doc
	rm -rf $(INSTALLDIR)/usr/local/Library
	# Place Git application in the right folder
	install -d $(INSTALLDIR)/Applications
	mv $(INSTALLDIR)/usr/local/share/git-gui/lib/Git\ Gui.app \
		$(INSTALLDIR)/Applications
	# Fix Python module position
	install -d $(INSTALLDIR)/Library/Python/2.6
	mv $(INSTALLDIR)/usr/local/lib/python2.6/site-packages \
		$(INSTALLDIR)/Library/Python/2.6
	rmdir $(INSTALLDIR)/usr/local/lib/python2.6
	# Fix Perl module position
	install -d $(INSTALLDIR)/Library/Perl/Updates/5.10.0
	mv $(INSTALLDIR)/usr/local/lib/perl5/site_perl/*.pm \
		$(INSTALLDIR)/Library/Perl/Updates/5.10.0
	# Nothing interesting is resting here
	rm -rf $(INSTALLDIR)/usr/local/lib
	rm -rf $(INSTALLDIR)/usr/local/share/info
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,README} $(INSTALLDOCDIR)
	# Manpages
	install -d $(INSTALLDIR)/usr/local/share/man
	tar jxf $(PORTDIR)/git-manpages-$(VERSION).tar.bz2 \
		-C $(INSTALLDIR)/usr/local/share/man
	# Strip
	find $(INSTALLDIR)/usr/local/bin -type f -exec strip {} \;
	find $(INSTALLDIR)/usr/local/libexec/git-core -type f -exec strip {} \;
	touch install

test: install
	for x in git git-receive-pack git-shell git-upload-archive git-upload-pack ; do \
		lipo $(INSTALLDIR)/usr/local/bin/$$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/libexec/git-core/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	# FIXME: /bin/sh: sparse: command not found
	#cd $(BUILDDIR) ; make check
	touch test

realdistclean: distclean
	rm -f retrieve $(SOURCE) git-manpages-$(VERSION).tar.bz2

