# GIT - Tree History Storage Tool
# http://git.or.cz/
# GPL

include ../../Library/Rules.mk

NAME=		git
VERSION=	1.7.3.1
REVISION=	0
URL=		http://www.kernel.org/pub/software/scm/git/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/Makefile.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make configure ; \
	env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install #install-doc
	rm -rf $(INSTALLDIR)/usr/local/Library
	# Place Git application in an better folder
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
	# Nothing interesting rest here
	rm -rf $(INSTALLDIR)/usr/local/lib
	rm -rf $(INSTALLDIR)/usr/local/share/info
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,README} $(INSTALLDOCDIR)
	find $(INSTALLDIR)/usr/local/bin -type f -exec strip {} \;
	touch install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/git -verify_arch i386 x86_64
	#cd $(BUILDDIR) ; make check
	touch test
